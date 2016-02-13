require 'spec_helper'

class DarkTree
  class MissingMethod
    describe Error do
      let(:params) do
        MethodMissingBaseParams()
      end

      subject { described_class.new(params) }

      context '#exec' do
        it "returns key's value" do
          expect { subject.exec }.to raise_error(NoMethodError)
        end
      end
    end
  end
end


