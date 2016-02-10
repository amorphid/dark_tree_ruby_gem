class DarkTree
  class MissingMethod
    class Error < Base
      def exec
        raise_error
      end

      private

      def raise_error
        raise NoKeyError.new(stringified_key)
      end

      def stringified_key
        key.to_s
      end
    end
  end
end
