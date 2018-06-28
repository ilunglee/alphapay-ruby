# AlphaPay
This is a ruby version of [AlphaPay](http://alphapay.ca/api/en.html) payment integration for:
- WeChat
- AliPay

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'alphapay'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install alphapay
```

## Usage
#### SETUP
```ruby
# rails
# config/initializers/alphapay.rb
AlphaPay.setup do |s|
  s.partner_code     = ENV['ALPHAPAY_PARTNER_CODE']
  s.credential_code  = ENV['ALPHAPAY_CREDENTIAL_CODE']
  s.notify_url       = ENV['ALPHAPAY_NOTIFY_URL']
  s.default_currency = ENV['ALPHAPAY_DEFAULT_CURRENCY']
end
```
---
#### WECHAT
```ruby
price   = 10
connect = AlphaPay::WeChat.connect(price)
# Get the request object
connect.request
#get the response object
connect.response
#get the qrcode
connect.qrcode
#get the pay_url
connect.pay_url
```
#### ALIPAY
```ruby
price   = 10
connect = AlphaPay::AliPay.connect(price)
# Get the request object
connect.request
# Get the response object
connect.response
# Get the qrcode
connect.qrcode
# Get the pay_url
connect.pay_url
```
#### EXCHANGE RATE
```ruby
price   = 10
connect = AlphaPay::ExchangeRate.connect(price)
# Get the request object
connect.request
# Get the response object
connect.response
# Get the rate
connect.rate
```

## Contributing
- Clone this repo and go into alphapay-ruby top-level directory and run `bundle install`
- To run the specs run `rspec spec`.
- To access irb development environment run `ruby bin/console`
- Submit a pull request for and explain what your changes are.
ps. You will usually want to write tests for your changes

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
