require 'spec_helper'

class DarkTree
  class MissingMethod
    describe Question do
      def params(symbol)
        MethodMissingBaseParams(key: symbol)
      end

      context '#exec' do
        it "returns true if key's value truthy" do
          subject = described_class.new(params(:a?))
          result  = subject.exec
          expect(result).to eq(true)
        end

        it "returns false if key's value falsey" do
          subject = described_class.new(params(:not_a_valid_key?))
          result  = subject.exec
          expect(result).to eq(false)
        end
      end
    end
  end
end
