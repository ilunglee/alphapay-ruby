module AlphaPay

  # Order
  class Order

    include AlphaPay::API::Signing
    include AlphaPay::API::Requests

    attr_accessor :description, :price, :currency, :response, :channel, :operator, :request

    def initialize(price, currency: nil, description: nil, order_id: nil)
      missing_keys? &&
        raise(AlphaPay::Exceptions::KeyMissingError.
              new(msg: 'missing credential_code && partner_code'))
      @description = description || "completes -> #{order_id}"
      @currency    = currency    || AlphaPay.default_currency
      @price       = price
      @order_id    = order_id
    end

    def connect
      send_request
    end

    def alphapay_order_id
      response['order_id']
    end

    def pay_url
      "#{response['pay_url']}?#{encode_params(params: signature)}"
    end

    def qrcode
      response['qrcode_img']
    end

    def order
      {
        order_id:    order_id,
        description: description,
        price:       price,
        currency:    currency,
        notify_url:  AlphaPay.notify_url
      }
    end

    def payload
      order.merge(channel: channel, operator: operator).to_json
    end

    def send_request
      self.request =
        RestClient.put("#{url}?#{encode_params(params: signature)}",
                       payload, content_type: :json, accept: :json)
      self.response = JSON.parse(request.body)
      self
    end

    def order_id
      @order_id ||=
        "#{AlphaPay.partner_code}#{Time.now.to_i}"
    end

    private

    def url
      "#{AlphaPay.api_base}/#{AlphaPay.partner_code}/orders/#{order_id}"
    end

  end

end
