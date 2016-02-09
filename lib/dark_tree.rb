class DarkTree < BasicObject
  include ::Kernel

  should_be_public  = [:__id__, :__send__]
  should_be_private = public_instance_methods - should_be_public
  should_be_private.each { |methyd| private methyd }

  def initialize(hash)
    @hash = hash
  end

  private

  def method_missing(key, *args)
    if @hash.member? key
      @hash[key]
    else
      raise NoKeyError
    end
  end
end

require 'dark_tree/version'
require 'dark_tree/no_key_error'
