module AlphaPay

  # UnifiedOrder
  class UnifiedOrder

    include AlphaPay::API::Signing

    attr_accessor :description, :price, :currency, :request

    def initialize(price, currency: 'CAD', description: nil)
      raise KeyMissingError.new(message: 'No access token set.') if missing_keys?
      @description = description || "completes -> #{order_id}"
      @price       = price
      @currency    = currency
    end

    def order
      {
        order_id:    order_id,
        description: description,
        price:       price,
        currency:    currency
      }
    end

    def payload(type)
      order.merge(type).to_json
    end

    private

    def send_request(type)
      self.request =
        RestClient.put("#{url}?#{encode_params(params: signature)}",
                       payload(type), content_type: :json, accept: :json)
      JSON.parse(request.body)
    end

    def encode_params(params:)
      URI.encode_www_form(params)
    end

    def missing_keys?
      AlphaPay.partner_code.nil? ||
        AlphaPay.credential_code.nil?
    end

    def order_id
      "#{AlphaPay.partner_code}#{Time.now.to_i}"
    end

    def url
      "#{AlphaPay.api_base}/#{AlphaPay.partner_code}/orders/#{order_id}"
    end

  end

end
