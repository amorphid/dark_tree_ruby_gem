class DarkTree
  class MissingMethod
    module Helpers
      def initialize(params)
        @params = params
      end

      private

      attr_reader :params

      def args
        @args ||= params[:args]
      end

      def block
        @block ||= params[:block] || -> {}
      end

      def dark_tree
        @dark_tree ||= params[:dark_tree]
      end

      def hash
        @hash ||= params.fetch(:hash)
      end

      def key
        @key ||= params.fetch(:key_as_symbol)
      end
    end
  end
end
