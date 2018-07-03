require 'spec_helper'

describe AlphaPay::AliPay do
  let(:subject) { AlphaPay::AliPay.new(10) }

  it 'has channel Alipay' do
    expect(subject.channel).to eq('Alipay')
  end

  it 'has channel operator' do
    expect(subject.operator).to eq('alipay qr')
  end

  it_behaves_like 'an order' do
    subject { AlphaPay::AliPay }
  end
end
