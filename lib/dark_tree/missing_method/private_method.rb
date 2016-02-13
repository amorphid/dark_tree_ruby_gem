class DarkTree
  class MissingMethod
    class PrivateMethod < Base
      def exec
        call
      end

      private

      def blokk?
        block ? true : false
      end

      def call
        if blokk?
          dark_tree.__send__(key, *args, &block)
        else
          dark_tree.__send__(key, *args)
        end
      end
    end
  end
end
