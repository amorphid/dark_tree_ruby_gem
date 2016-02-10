class DarkTree
  class MissingMethod
    class Member < Base
      def exec
        key_value
      end

      private

      def key_value
        hash[key]
      end
    end
  end
end
