class DarkTree
  class NoKeyError < ::StandardError
    def initialize(msg)
      super(msg.to_s)
    end
  end
end
