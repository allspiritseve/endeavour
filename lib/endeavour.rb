require 'endeavour/version'
require 'endeavour/core_ext'

class Endeavour
  # Verb: Try hard to do or achieve something.
  def self.call(object, method, *args, &block)
    object.send(method, *args, &block) if object.respond_to?(method)
  end

  # Noun: An attempt to achieve a goal.
  def initialize(object)
    @object = object
  end

  %w(inspect to_s).each do |method|
    define_method(method) do |*args, &block|
      self.class.call(@object, method, *args, &block)
    end
  end

  def method_missing(method, *args, &block)
    self.class.call(@object, method, *args, &block)
  end
end

require 'endeavour/railtie' if defined?(Rails)
