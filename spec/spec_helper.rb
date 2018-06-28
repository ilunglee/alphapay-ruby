require 'bundler/setup'
Bundler.setup

require 'ap'
require 'webmock/rspec'
require 'byebug'
require 'alphapay'
require 'vcr'

WebMock.disable_net_connect!(allow_localhost: true)

Dir['./spec/support/**/*.rb'].each { |f| require f }
