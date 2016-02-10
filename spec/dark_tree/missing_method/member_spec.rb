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

      context '#key_value' do
        it "returns key's value" do
          result = subject.send(:key_value)
          expect(result).to eq(params[:hash][:a])
        end
      end
    end
  end
end
