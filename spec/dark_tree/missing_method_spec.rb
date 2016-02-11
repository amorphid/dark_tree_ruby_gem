require 'spec_helper'

class DarkTree
  describe MissingMethod do
    def params(symbol)
      MethodMissingBaseParams(key: symbol)
    end

    context '#strategy' do
      it 'returns Member w/ hash key' do
        subject = described_class.new(params(:a))
        result  = subject.send(:strategy)
        expect(result).to eq(::DarkTree::MissingMethod::Member)
      end

      it 'returns Question w/ question key' do
        subject = described_class.new(params(:a?))
        result  = subject.send(:strategy)
        expect(result).to eq(::DarkTree::MissingMethod::Question)
      end

      it 'returns Error w/ invalid key' do
        subject = described_class.new(params(:not_a_valid_key))
        result  = subject.send(:strategy)
        expect(result).to eq(::DarkTree::MissingMethod::Error)
      end
    end
  end
end
