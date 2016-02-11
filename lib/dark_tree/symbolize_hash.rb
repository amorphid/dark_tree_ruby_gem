class DarkTree
  class SymbolizeHash
    def self.symbolize(old_hash)
      new_hash(old_hash)
    end

    class << self
      private

      def new_hash(old_hash)
        {}.tap do |new_hash|
          old_hash.each_pair do |old_key, old_value|
            new_hash[new_key(old_key)] = new_value(old_value)
          end
        end
      end

      def new_key(object)
        SymbolizeObject.symbolize(object)
      end

      def new_value(object)
        DuplicateObject.duplicate(object)
      end
    end
  end
end
