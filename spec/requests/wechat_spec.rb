require 'spec_helper'

describe AlphaPay::WeChat do
  let(:subject) { AlphaPay::WeChat.new(10) }

  it 'has channel Wechat' do
    expect(subject.channel).to eq('Wechat')
  end

  it 'has channel operator' do
    expect(subject.operator).to eq('wechat qr')
  end

  it_behaves_like 'an order' do
    subject { AlphaPay::WeChat }
  end
end
