module AlphaPay

  # WeChat
  class WeChat < UnifiedOrder

    WECHAT_QR = { channel: 'Wechat', operator: 'wechat qr' }.freeze

    def qrcode
      send_request(WECHAT_QR)
    end

  end

end
