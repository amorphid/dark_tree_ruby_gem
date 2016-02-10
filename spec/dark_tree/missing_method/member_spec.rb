require 'spec_helper'

class DarkTree
  class MissingMethod
    describe Member do
      let(:params) do
        {
          hash: { a: 'hey!' },
          key_as_symbol: :a
        }
      end

      subject { described_class.new(params) }

      context '#exec' do
        it "returns key's value" do
          result = subject.exec
          expect(result).to eq(params[:hash][:a])
        end
      end
    end
  end
end
