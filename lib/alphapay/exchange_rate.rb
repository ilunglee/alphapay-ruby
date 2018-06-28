module AlphaPay

  # ExchangeRate
  class ExchangeRate

    include AlphaPay::API::Signing
    include AlphaPay::API::Requests
    extend AlphaPay::Callable

    PATH = 'exchange_rate'.freeze
    CNY  = 'CNY'.freeze

    attr_accessor :rate, :price, :currency, :response, :request

    def initialize(price, currency: CNY)
      @currency = currency
      @price    = price
    end

    def connect
      request_rate
    end

    def convert
      rate['return_code'] != 'SUCCESS' &&
        raise(AlphaPay::Exceptions::RequestFailedError.
              new(msg: 'Request for exchange rate failed'))
      BigDecimal(price) / rate['rate'] / 100
    end

    private

    def not_valid_currency?
      currency != CNY
    end

    def request_rate
      not_valid_currency? &&
        raise(AlphaPay::Exceptions::CurrencyNotAllowedError.
              new(msg: 'You can only convert CAD to CNY'))
      self.request =
        RestClient.get("#{url}?#{encode_params(params: signature)}",
                       content_type: :json, accept: :json)
      self.response = JSON.parse(request.body)
      self.rate     = response['rate']
      self
    end

    def url
      "#{AlphaPay.api_base}/#{AlphaPay.partner_code}/#{PATH}"
    end

  end

end

