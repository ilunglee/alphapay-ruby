require 'spec_helper'

describe AlphaPay do
  it 'should have a version number' do
    expect(AlphaPay::VERSION).not_to be nil
  end

  it 'should have an partner_code property' do
    expect(AlphaPay).to respond_to(:partner_code)
  end

  it 'should have an credential_code property' do
    expect(AlphaPay).to respond_to(:credential_code)
  end

  it 'should have an notify_url property' do
    expect(AlphaPay).to respond_to(:notify_url)
  end

  it 'should have a default_currency property' do
    expect(AlphaPay).to respond_to(:default_currency)
  end

  it 'should have a api_base property' do
    expect(AlphaPay).to respond_to(:api_base)
  end
end

