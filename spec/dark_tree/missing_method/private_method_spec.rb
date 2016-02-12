require 'spec_helper'

class DarkTree
  class MissingMethod
    describe PrivateMethod do
      let(:params) { MethodMissingBaseParams(key: :class) }

      subject { described_class.new(params) }

      context '#exec' do
        it 'returns the class' do
          result = subject.exec
          expect(result).to eq(DarkTree)
        end
      end
    end
  end
end
