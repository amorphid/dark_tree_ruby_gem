require 'json'

class DarkTree
  class MissingMethod
    include Helpers

    def exec
      strategy.new(params).exec
    end

    private

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
      key[-1] == '?' && !(::DarkTree::RESERVED_HASH_KEYS.member? key)
    end
  end
end
