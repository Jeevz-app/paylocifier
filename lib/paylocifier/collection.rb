require 'active_support/inflector'

require_relative 'client'

class Paylocifier::Collection
  include Enumerable

  class NotFound < StandardError; end

  attr_reader :data, :model_class, :path

  def initialize(data: [], model_class: nil, path: nil)
    @data           = Array(data)
    @model_class    = model_class || @data.first&.class || raise(ArgumentError.new('Paylocifier::Collection initialization requries model_class if data is empty'))
    @path           = path
  end

  def find(id)
    data.find { |item| item.id.to_s === id.to_s }
  end

  def find!(id)
    find(id) || raise(NotFound.new("Couldn't find record with id #{ id }"))
  end

  def create(data)
    data.deep_transform_keys! { |x| x.to_s.camelize(:lower) }

    model_class.new(client.post(path, data))
  end

  private

  def method_missing(method, *args, &block)
    return data.send(method, *args, &block) if data.respond_to?(method)
    super
  end

  def client
    @client ||= Paylocifier::Client.new
  end
end
