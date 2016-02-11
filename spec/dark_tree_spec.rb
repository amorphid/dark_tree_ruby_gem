require 'spec_helper'

describe DarkTree do
  let(:hash) do
    { a: { b: 'hey!', c: {} }}
  end

  subject { described_class.new(hash) }

  it 'has a version number' do
    expect(DarkTree::VERSION).not_to be nil
  end

  it 'has N public methods' do
    # even though subject only has N public methods,
    # rspec (and maybe other gems) adds some methods for testing,
    # and since native Ruby methods have a source location of `nil`,
    # rejecting methods with a source location returns on native Ruby methods
    reject_rspec_methods = -> {
      public_methods.reject { |m| method(m).source_location }
    }

    size = subject.__send__(:instance_exec, &reject_rspec_methods).size
    expect(size).to eq(3)
  end

  it 'returns value of hash key' do
    expect(subject.a).to eq(hash[:a])
  end

  it 'raises error if key not found (and no question mark)' do
    expect { subject.is_this_a_valid_key }
    .to raise_error(::DarkTree::NoKeyError)
  end

  context 'for keys with question marks' do
    it 'returns true for truthy value' do
      expect(subject.a?).to eq(true)
    end

    it 'returns false for falsey value' do
      expect(subject.is_this_a_valid_key?).to eq(false)
    end
  end
end
