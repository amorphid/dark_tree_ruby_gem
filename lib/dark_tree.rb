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

  def initialize(object)
    @hash = SymbolizeHash.symbolize(object.to_hash)
  end

  private

  def to_hash
    @hash
  end

  def method_missing(key, *args, &block)
    MissingMethod.new({
      args:      args,
      block:     block,
      dark_tree: self,
      hash:      @hash,
      key_as_symbol: key
    }).exec
  end
end

require 'pp'
require 'set'

require 'dark_tree/key'
require 'dark_tree/no_key_error'
require 'dark_tree/reserved_method_error'
require 'dark_tree/version'

require 'dark_tree/missing_method'
require 'dark_tree/missing_method/base'
require 'dark_tree/missing_method/error'
require 'dark_tree/missing_method/member'
require 'dark_tree/missing_method/question'

require 'dark_tree/symbolize_hash'
require 'dark_tree/symbolize_hash/duplicate_object'
require 'dark_tree/symbolize_hash/symbolize_object'
