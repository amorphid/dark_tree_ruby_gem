require 'spec_helper'

class DarkTree
  class MissingMethod
    describe PrivateMethod do
      let(:params) { MethodMissingBaseParams(key: :class) }

      subject { described_class.new(params) }

      context '#exec' do
        it 'returns the class' do
          result = subject.class
          expect(result).to eq(described_class)
        end
      end
    end
  end
end
