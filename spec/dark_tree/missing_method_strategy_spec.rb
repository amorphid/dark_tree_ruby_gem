require 'spec_helper'

class DarkTree
  describe MissingMethodStrategy do
    let(:hash) do
      { a: 'hey!' }
    end

    def new_subject(key)
      described_class.new(hash, key)
    end

    context '#execute' do
      it 'calls #member if hash key' do
        stub_instance_method_with_called_message(:member)
        subject = new_subject(:a)
        expect(subject.execute).to eq(called_message)
      end

      it 'calls #question if hash key' do
        stub_instance_method_with_called_message(:question)
        subject = new_subject(:a?)
        expect(subject.execute).to eq(called_message)
      end

      it 'calls #error if hash key' do
        stub_instance_method_with_called_message(:error)
        subject = new_subject(:not_a_valid_key)
        expect(subject.execute).to eq(called_message)
      end
    end

    context '#member' do
      it 'returns value of hash key' do
        key     = :a
        subject = new_subject(key)
        expect(subject.send(:member)).to eq(hash[key])
      end
    end

    context '#member?' do
      it 'returns true if hash key' do
        subject = new_subject(:a)
        expect(subject.send(:member?)).to eq(true)
      end

      it 'returns false if no hash key' do
        subject = new_subject(:b)
        expect(subject.send(:member?)).to eq(false)
      end
    end

    context 'question' do
      it 'returns true if truthy hash value' do
        subject = new_subject(:a?)
        expect(subject.send(:question)).to eq(true)
      end

      it 'returns false if falsey hash value' do
        subject = new_subject(:b?)
        expect(subject.send(:question)).to eq(false)
      end
    end

    context 'question?' do
      it 'returns true if key ends in "?"' do
        subject = new_subject(:ends_in_question_mark?)
        expect(subject.send(:question?)).to eq(true)
      end

      it 'returns false if key does not end in "?"' do
        subject = new_subject(:no_question_mark)
        expect(subject.send(:question?)).to eq(false)
      end
    end

    context '#error' do
      it 'raises error if no hash key' do
        subject = new_subject(:not_a_valid_key)

        expect { subject.send(:error) }
        .to raise_error(::DarkTree::NoKeyError)
      end
    end
  end
end
