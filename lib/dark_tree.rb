class DarkTree < BasicObject
  include ::Kernel

  reserved_methods = [ :__id__, :__send__, :inspect]
  question_methods = public_instance_methods.select do |m|
    if m[-1] == '?'
      m[0..-2].to_sym
    end
  end

  reserved_hash_keys = reserved_methods + question_methods

  RESERVED_HASH_KEYS = ::Set.new(reserved_hash_keys).freeze

  should_be_public  = RESERVED_HASH_KEYS.to_a
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

require 'dark_tree/missing_method/helpers'
require 'dark_tree/missing_method'
require 'dark_tree/missing_method/base'
require 'dark_tree/missing_method/error'
require 'dark_tree/missing_method/member'
require 'dark_tree/missing_method/private_method'
require 'dark_tree/missing_method/question'

require 'dark_tree/symbolize_hash'
require 'dark_tree/symbolize_hash/duplicate_object'
require 'dark_tree/symbolize_hash/symbolize_object'
