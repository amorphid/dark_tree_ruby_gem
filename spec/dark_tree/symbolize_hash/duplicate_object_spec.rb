require 'spec_helper'

class DarkTree
  class SymbolizeHash
    describe DuplicateObject do
      subject { described_class }

      context '#self.duplicate' do
        it 'duplicates a string' do
          old_string = 'i am string... or am i?!'
          new_string = subject.duplicate(old_string)
          result     = new_string.equal? old_string
          expect(result).to eq(false)
        end

        it 'duplicates an empty hash' do
          old_hash = {}
          new_hash = subject.duplicate(old_hash)
          result   = new_hash.equal? old_hash
          expect(result).to eq(false)
        end

        it 'returns un-duplicate-able object' do
          old_object  = [1, 2.0, :"3", BasicObject].sample
          same_object = subject.duplicate(old_object)
          result      = same_object.equal?(old_object)
          expect(result).to eq(true)
        end

        it 'does not raise error for unduplicatable objects' do
          cant_dup_this = [1, 2.0, :"3", BasicObject].sample
          expect { subject.duplicate(cant_dup_this) }.not_to raise_error
        end
      end
    end
  end
end
