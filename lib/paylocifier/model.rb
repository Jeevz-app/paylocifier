require 'active_support/inflector'
require 'active_support/core_ext/hash'
require 'hashie'

require_relative 'collection'
require_relative 'client'

class Paylocifier::Model
  # private_class_method :new

  class << self
    attr_reader :url, :associations

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

    def client
      @client ||= Paylocifier::Client.new
    end

    def all
      collection = client.get(url).map do |data|
        self.new(data)
      end

      Paylocifier::Collection.new(
        data:           collection,
        model_class:    self.class,
        path:           url,
      )
    end

    def find(id)
      self.new(client.get("#{ url }/#{ id }"))
    end

    def create(data)
      data.deep_transform_keys! { |x| x.to_s.camelize(:lower) }

      self.new(client.post("#{ url }", data))
    end
  end

  attr_reader :data

  def initialize(data)
    @data = Hashie::Mash.new(data)
  end

  def update(data)
  end

  def id; self.send(id_alias); end

  protected

  def fetch_association(association_name)
    association_class = "Paylocifier::#{ association_name.to_s.singularize.capitalize }".constantize
    association_path  = "#{ url }/#{ self.id }/#{ association_name }"

    collection = client.get(association_path).map do |data|
      association_class.new(data)
    end

    Paylocifier::Collection.new(
      data:         collection,
      model_class:  association_class,
      path:         association_path
    )
  end

  def client; self.class.client; end
  def url; self.class.url; end
  def id_alias; self.class.id_alias; end
  def associations; self.class.associations; end

  private

  def method_missing(method, *args)
    return data.send(method, *args)   if data.respond_to?(method)
    return fetch_association(method)  if Array(associations).include?(method.to_s)

    super
  end
end
