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

    def args
      @args ||= params[:args]
    end

    def block
      @block ||= params[:block] || -> {}
    end

    def dark_tree
      @dark_tree ||= params[:dark_tree]
    end

    def hash
      @hash ||= params[:hash]
    end

    def key
      @key ||= params[:key_as_symbol]
    end

    def member?
      hash.member?(key)
    end

    def private_method?
      dark_tree.__send__(:respond_to?, key, true)
    end

    def strategy
      case
      when member?
        Member
      when question?
        Question
      when private_method?
        PrivateMethod
      else
        Error
      end
    end

    def question?
      key[-1] == '?'
    end
  end
end
