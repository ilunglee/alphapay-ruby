module AlphaPay

  module Exceptions

    # KeyMissingError
    class KeyMissingError < StandardError

      def initialize(msg:)
        super(msg)
      end

    end

  end

end