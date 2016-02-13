require 'spec_helper'

class DarkTree
  class SymbolizeHash
    describe SymbolizeObject do
      subject { described_class }

      context '#self.symbolize' do
        it 'returns symbol w/ symbol' do
          symbol = :hey_look_a_symbol
          result = subject.symbolize(symbol)
          expect(result).to eq(symbol)
        end

        it 'returns symbol w/ string' do
          string = 'hey_look_a_string'
          result = subject.symbolize(string)
          expect(result).to eq(string.to_sym)
        end

        it 'returns symbol w/ Object' do
          object = Object.new
          result = subject.symbolize(object)
          expect(result).to eq(object.to_s.to_sym)
        end

        it 'raises an error if symbol is reserved' do
          symbol = ::DarkTree::RESERVED_HASH_KEYS
                   .to_a
                   .sample
          expect { subject.symbolize(symbol) }
          .to raise_error(::DarkTree::ReservedMethodError)
        end
      end
    end
  end
end
