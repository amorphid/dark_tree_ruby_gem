require 'spec_helper'

class DarkTree
  class MissingMethod
    describe Member do
      def params(hash)
        MethodMissingBaseParams(hash: hash)
      end

      context '#exec' do
        it "returns a string" do
          hash        = { a: 'hey!' }
          subject     = described_class.new(params(hash))
          result      = subject.exec
          expect(result).to eq(hash[:a])
        end

        it 'returns instance of DarkTree w/ occupied hash' do
          subject = described_class.new(params(a: { b: 'hey!' }))
          result   = subject.exec
          expect(result).to be_instance_of(DarkTree)
        end

        it 'returns instance of Hash w/ empty hash' do
          subject = described_class.new(params(a: {}))
          result   = subject.exec
          expect(result).to be_instance_of(Hash)
        end
      end
    end
  end
end
