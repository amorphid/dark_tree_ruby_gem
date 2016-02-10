class DarkTree
  class MissingMethod
    class Question < Base
      def exec
        truthy?
      end

      private

      def questionless
        key[0..-2].to_sym
      end

      def object
        hash[questionless]
      end

      def truthy?
        object ? true : false
      end
    end
  end
end


