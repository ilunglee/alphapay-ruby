require 'spec_helper'

describe AlphaPay::ExchangeRate do
  describe 'should throw an error if the currency is not eql to CNY' do
    subject { AlphaPay::ExchangeRate.connect(10, currency: 'CAD') }
    it do
      expect { subject }.
        to raise_error(AlphaPay::Exceptions::CurrencyNotAllowedError,
                       'You can only convert CAD to CNY')
    end
  end

  describe 'should return rate', vcr: true do
    subject { AlphaPay::ExchangeRate.connect(10) }
    it do
      expect(subject.rate).to_not eq(nil)
    end
  end
end
