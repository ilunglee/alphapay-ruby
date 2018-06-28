module AlphaPay

  # WeChat
  class WeChat < AlphaPay::Order

    CHANNEL  = 'Wechat'.freeze
    OPERATOR = 'wechat qr'.freeze

    def channel
      CHANNEL
    end

    def operator
      OPERATOR
    end

  end

end
