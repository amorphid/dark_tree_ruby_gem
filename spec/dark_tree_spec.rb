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
end
