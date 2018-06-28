module AlphaPay

  module Exceptions

    # Base Error
    class BaseError < StandardError

      def initialize(msg:)
        super(msg)
      end

    end

    class KeyMissingError < BaseError; end
    class CurrencyNotAllowedError < BaseError; end
    class RequestFailedError < BaseError; end

  end

end
