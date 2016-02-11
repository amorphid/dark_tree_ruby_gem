require 'spec_helper'

class DarkTree
  describe SymbolizeHash do
    subject { described_class }

    context '#self.symbolize' do
      it 'converts hash keys from non-symbols to symbols' do
        stringified = { "a" => 'hey!' }
        symbolized  =  { a: 'hey!' }
        result      = subject.symbolize(stringified)
        expect(result).to eq(symbolized)
      end
    end
  end
end
