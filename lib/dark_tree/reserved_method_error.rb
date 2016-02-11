class DarkTree
  class ReservedMethodError < ::StandardError
    def initialize(msg)
      super(msg.to_s)
    end
  end
end
