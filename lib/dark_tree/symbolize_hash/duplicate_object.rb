class DarkTree
  class SymbolizeHash
    class DuplicateObject
      def self.duplicate(object)
        dup(object)
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
      end
    end
  end
end
