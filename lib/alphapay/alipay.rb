module AlphaPay

  # AliPay
  class AliPay < UnifiedOrder

    ALIPAY_QR = { channel: 'Alipay', operator: 'alipay qr' }.freeze

    def qrcode
      send_request(ALIPAY_QR)
    end

  end

end
