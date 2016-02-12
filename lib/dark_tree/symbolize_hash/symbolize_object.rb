class DarkTree
  class SymbolizeHash
    class SymbolizeObject
      def self.symbolize(object)
        vet(to_sym(object))
      end

      class << self
        private

        def to_sym(object)
          begin
            object.__send__(:to_sym)
          rescue
            object.__send__(:to_s)
                .__send__(:to_sym)
          end
        end

        def vet(symbol)
          raise_error(symbol) if reserved?(symbol)

          symbol
        end

        def raise_error(symbol)
          raise ::DarkTree::ReservedMethodError.new(symbol)
        end

        def reserved?(symbol)
          ::DarkTree::RESERVED_HASH_KEYS.member? symbol
        end
      end
    end
  end
end
