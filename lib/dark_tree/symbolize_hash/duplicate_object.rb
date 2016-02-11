class DarkTree
  class SymbolizeHash
    class DuplicateObject
      def self.duplicate(object)
        if occupied_hash?(object)
          dark_tree(object)
        else
          dup(object)
        end
      end

      class << self
        private

        def dup(object)
          begin
            object.dup
          rescue
            object
          end
        end

        def dark_tree(object)
          ::DarkTree.new(object.__send__(:to_hash))
        end

        def hash?(object)
          object.__send__(:respond_to?, :to_hash, true)
        end

        def occupied?(object)
          object.__send__(:size) > 0
        end

        def occupied_hash?(object)
          hash?(object) && occupied?(object)
        end
      end
    end
  end
end
