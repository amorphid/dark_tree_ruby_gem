class DarkTree
  class MissingMethod
    class Base
      attr_reader :params

      def initialize(params)
        @params = params
      end

      private

      def hash
        @hash ||= params.fetch(:hash)
      end

      def key
        @key ||= params.fetch(:key_as_symbol)
      end
    end
  end
end
