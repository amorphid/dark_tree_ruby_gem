require 'spec_helper'

describe DarkTree do
  let(:hash) do
    { a: { b: 'hey!', c: {} }}
  end

  subject { described_class.new(hash) }

  it 'has a version number' do
    expect(DarkTree::VERSION).not_to be nil
  end

  it 'returns value of leaf' do
    expect(subject.a.b).to eq(hash[:a][:b])
    expect(subject.a.c).to eq(hash[:a][:c])
  end

  it 'raises error if key not found (and no question mark)' do
    expect { subject.is_this_a_valid_key }
    .to raise_error(NoMethodError)
  end

  context 'for keys with question marks' do
    it 'returns true for truthy value' do
      expect(subject.a?).to eq(true)
    end

    it 'returns false for falsey value' do
      expect(subject.is_this_a_valid_key?).to eq(false)
    end
  end

  context '#to_hash' do
    it 'returns @hash' do
      dark_tree    = DarkTree.new(hash)
      instance_var = dark_tree.__send__(:instance_variable_get, '@hash')
      hash         = dark_tree.__send__(:to_hash)
      result       = hash.equal?(instance_var)
      expect(result).to eq(true)
    end
  end
end
