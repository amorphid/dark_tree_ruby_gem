class DarkTree
  class MissingMethod
    class Member < Base
      def exec
        member(key_value)
      end

      private

      def hash?(object)
        object.__send__(:respond_to?, :to_hash, true)
      end

      def key_value
        hash[key]
      end

      def member(object)
        if occupied_hash?(object)
          new_dark_tree(object)
        else
          object
        end
      end

      def new_dark_tree(hash)
        ::DarkTree.new(hash)
      end

      def occupied?(object)
        object.__send__(:to_hash).size > 0
      end

      def occupied_hash?(object)
        hash?(object) && occupied?(object)
      end
    end
  end
end
