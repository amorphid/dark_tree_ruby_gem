class DarkTree < BasicObject
  include ::Kernel

  should_be_public  = [:__id__, :__send__, :inspect]
  should_be_private = public_instance_methods - should_be_public
  should_be_private.each { |methyd| private methyd }

  def initialize(hash)
    @hash = hash
  end

  private

  def method_missing(key, *args)
    MissingMethodStrategy.new(@hash, key).execute
  end
end

require 'dark_tree/version'
require 'dark_tree/no_key_error'
require 'dark_tree/missing_method_strategy'

require 'dark_tree/missing_method'
require 'dark_tree/missing_method/base'
require 'dark_tree/missing_method/member'
require 'dark_tree/missing_method/question'
