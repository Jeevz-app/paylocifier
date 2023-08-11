require 'active_support/inflector'
require 'active_support/core_ext/hash'
require 'hashie'

require_relative 'collection'
require_relative 'client'

class Paylocifier::Model
  # private_class_method :new

  class << self
    attr_reader :url, :associations, :legacy

    def endpoint(url)
      @url ||= url
    end

    def has_many(association)
      @associations ||= []
      @associations << association.to_s
    end

    def associations
      @associations || []
    end

    def id(name)
      @id_alias = name
    end

    def id_alias
      @id_alias || :id
    end

    def create_method(method_name)
      @create_verb = method_name
    end

    def create_verb
      @create_verb || :post
    end

    def legacy!
      @legacy = true
    end

    def client
      @client ||= Paylocifier::Client.new
    end

    def all
      collection = client.get(url, legacy: legacy).map do |data|
        self.new(data)
      end

      Paylocifier::Collection.new(
        data:           collection,
        model_class:    self.class,
        path:           url,
      )
    end

    def find(id)
      self.new(client.get("#{ url }/#{ id }", legacy: legacy))
    end

    def create(data)
      data.deep_transform_keys! { |x| x.to_s.camelize(:lower) }

      self.new(client.post("#{ url }", data, legacy: legacy))
    end
  end

  attr_reader :data, :path

  def initialize(data, relative_path: nil)
    @data = Hashie::Mash.new(data)
    @path = relative_path
  end

  def update(data)
  end

  def destroy
    client.delete(delete_path || uri)
  end

  def id; self.send(id_alias); end

  def uri
    [(path || url), "#{ self.id }"].compact.join('/')
  end

  protected

  def delete_path; end

  def fetch_association(association_name)
    association_class = "Paylocifier::#{ association_name.to_s.singularize.capitalize }".constantize
    association_path  = "#{ uri }/#{ association_name }"

    collection = client.get(association_path, legacy: legacy).map do |data|
      association_class.new(data)
    end

    Paylocifier::Collection.new(
      data:         collection,
      model_class:  association_class,
      path:         association_path
    )
  end

  def association(association_name)
    ivar = :"@#{ association_name }"
    instance_variable_get(ivar) || instance_variable_set(ivar, begin
      association_class = "Paylocifier::#{ association_name.to_s.singularize.capitalize }".constantize
      association_path  = "#{ uri }/#{ association_name }"

      Paylocifier::Collection.new(
        data:         nil,
        model_class:  association_class,
        path:         association_path
      )
    end)
  end

  def client; self.class.client; end
  def url; self.class.url; end
  def id_alias; self.class.id_alias; end
  def legacy; self.class.legacy; end
  def associations; self.class.associations; end

  private

  def method_missing(method, *args)
    return data.send(method, *args)   if data.respond_to?(method)
    return association(method) if Array(associations).include?(method.to_s)

    super
  end
end
