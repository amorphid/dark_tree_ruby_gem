def stub_instance_method_with_called_message(symbol, args = {})
  matcher = allow_any_instance_of(described_class)
            .to receive(symbol)
  matcher.with(args) unless args.empty?
  matcher.and_return(called_message)
end

def called_message
  'I was called, and I enjoyed it'
end
