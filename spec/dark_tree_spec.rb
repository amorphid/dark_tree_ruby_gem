require 'spec_helper'

describe DarkTree do
  let(:hash) do
    { a: { b: 'hey!', c: {} }}
  end

  subject { described_class.new(hash) }

  it 'has a version number' do
    expect(DarkTree::VERSION).not_to be nil
  end

  it 'has 2 public methods, __id__ and __send__' do
    # even though subject only has two public methods,
    # rspec (and maybe other gems) adds some methods for testing,
    # and since native Ruby methods have a source location of `nil`,
    # rejecting methods with a source location returns on native Ruby methods
    reject_rspec_methods = -> {
      public_methods.reject { |m| method(m).source_location }
    }

    result      = subject.__send__(:instance_exec, &reject_rspec_methods).sort
    two_methods = [:__id__, :__send__]
    expect(result).to eq(two_methods)
  end
end
