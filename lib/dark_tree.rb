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
    if @hash.member? key
      return @hash[key]
    end

    if question_key?(key)
      questionless_key = key[0..-2].to_sym
      return @hash[questionless_key] ? true : false
    end

    raise NoKeyError, "#{key}"
  end

  def question_key?(key)
    key[-1] == '?'
  end
end

require 'dark_tree/version'
require 'dark_tree/no_key_error'
