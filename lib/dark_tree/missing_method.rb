class DarkTree
  class MissingMethod
    attr_reader :params

    def initialize(params)
      @params = params
    end

    def exec
      strategy.new(params).exec
    end

    private

    def hash
      @hash ||= params.fetch(:hash)
    end

    def key
      @key ||= params.fetch(:key_as_symbol)
    end

    def member?
      hash.member?(key)
    end

    def strategy
      case
      when member?
        Member
      when question?
        Question
      else
        Error
      end
    end

    def question?
      key[-1] == '?'
    end
  end
end
