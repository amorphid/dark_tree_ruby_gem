class DarkTree
  class NoKeyError < ::StandardError
    def initialize(msg = 'insert more meaningful error message here')
      super
    end
  end
end
