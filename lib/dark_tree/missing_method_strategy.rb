class DarkTree
  class MissingMethodStrategy
    attr_reader :hash, :key

    def initialize(hash, key_as_symbol)
      @hash = hash
      @key  = key_as_symbol
    end

    def execute
      case
      when member?
        member
      when question?
        question
      else
        error
      end
    end

    private

    def error
      raise(NoKeyError, key.to_sym)
    end

    def member
      hash[key]
    end

    def member?
      hash.member?(key)
    end

    def question
      truthy?(
        hash[
          questionless])
    end

    def question?
      key[-1] == '?'
    end

    def questionless
      key[0..-2].to_sym
    end

    def truthy?(object)
      object ? true : false
    end
  end
end
