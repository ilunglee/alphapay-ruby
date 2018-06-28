# Require Dependencies
require 'rest-client'
require 'digest'
require 'logger'
require 'json/ext'
require 'bigdecimal'

# Require Extensions
require 'extensions/array'
require 'extensions/callable'

# Require Version
require 'alphapay/version'

# Require Exceptions
require 'alphapay/exceptions/errors'

# Require API
require 'alphapay/api/signing'
require 'alphapay/api/requests'

# Require Order
require 'alphapay/order'
require 'alphapay/wechat'
require 'alphapay/alipay'

# Require ExchangeRate
require 'alphapay/exchange_rate'

# Base Module
module AlphaPay

  @api_base         = 'https://pay.alphapay.ca/api/v1.0/gateway/partners'
  @log_level        = nil
  @logger           = nil
  @default_currency = 'CAD'

  class << self

    attr_accessor :partner_code, :credential_code, :notify_url, :default_currency

  end

  def self.api_base
    @api_base
  end

  def self.setup
    yield self
  end

end
