# Require Dependencies
require 'rest-client'
require 'digest'
require 'logger'
require 'json/ext'

# Require Version
require 'alphapay/version'

# Require Exceptions
require 'alphapay/exceptions/key_missing_error'

# Require Extensions
require 'extensions/array'
require 'extensions/callable'

# Require API
require 'alphapay/api/signing'

# Require Vendor
require 'alphapay/unified_order'
require 'alphapay/wechat'
require 'alphapay/alipay'

# Base Module
module AlphaPay

  @api_base  = 'https://pay.alphapay.ca/api/v1.0/gateway/partners'
  @log_level = nil
  @logger    = nil

  class << self

    attr_accessor :partner_code, :credential_code, :notify_url

  end

  def self.api_base
    @api_base
  end

end
