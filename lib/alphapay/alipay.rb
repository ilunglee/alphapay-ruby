module AlphaPay

  # AliPay
  class AliPay < AlphaPay::Order

    CHANNEL  = 'Alipay'.freeze
    OPERATOR = 'alipay qr'.freeze

    def channel
      CHANNEL
    end

    def operator
      OPERATOR
    end

  end

end
