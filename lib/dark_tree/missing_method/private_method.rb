class DarkTree
  class MissingMethod
    class PrivateMethod < Base
      def exec
        call
      end

      private

      def call
        dark_tree.__send__(key, *args, &block)
      end
    end
  end
end
