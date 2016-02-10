require 'spec_helper'

class DarkTree
  class MissingMethod
    describe Question do
      def params(symbol)
        {
          hash: { a: 'hey!' },
          key_as_symbol: symbol
        }
      end

      context '#truthy?' do
        it "returns true if key's value truthy" do
          subject = described_class.new(params(:a?))
          result  = subject.send(:truthy?)
          expect(result).to eq(true)
        end

        it "returns false if key's value falsey" do
          subject = described_class.new(params(:not_a_valid_key?))
          result  = subject.send(:truthy?)
          expect(result).to eq(false)
        end
      end
    end
  end
end
