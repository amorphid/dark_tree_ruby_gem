class DarkTree < BasicObject
  include ::Kernel

  RESERVED_PUBLIC_INSTANCE_METHODS = ::Set.new([
    :__id__,
    :__send__,
    :inspect
  ]).freeze

  should_be_public  = RESERVED_PUBLIC_INSTANCE_METHODS.to_a
  should_be_private = public_instance_methods - should_be_public
  should_be_private.each { |methyd| private methyd }

  def initialize(hash)
    @hash = hash
  end

  private

  def method_missing(key, *args)
    MissingMethod.new(hash: @hash, key_as_symbol: key).exec
  end
end

require 'set'

require 'dark_tree/version'
require 'dark_tree/no_key_error'

require 'dark_tree/missing_method'
require 'dark_tree/missing_method/base'
require 'dark_tree/missing_method/error'
require 'dark_tree/missing_method/member'
require 'dark_tree/missing_method/question'
