require 'spec_helper'

shared_examples 'an order' do
  it 'should throw an error if the partner_code is nil' do
    allow(AlphaPay).to receive(:partner_code) { nil }
    expect { subject.new(10) }.
      to raise_error(AlphaPay::Exceptions::KeyMissingError,
                     'missing credential_code && partner_code')
  end

  it 'should throw an error if the credential_code is nil' do
    allow(AlphaPay).to receive(:credential_code) { nil }
    expect { subject.new(10) }.
      to raise_error(AlphaPay::Exceptions::KeyMissingError,
                     'missing credential_code && partner_code')
  end

  it 'should response with INVALID', vcr: true do
    allow(AlphaPay).to receive(:partner_code) { 'bad_code' }
    allow(AlphaPay).to receive(:credential_code) { 'bad_code' }
    expect(subject.connect(10).response['return_code']).
      to eq('INVALID_SHORT_ID')
  end

  it 'should allow custom order_id', vcr: true do
    expect(subject.connect(10, order_id: '999999').response['partner_order_id']).
      to eq('999999')
  end

  it 'returns success', vcr: true do
    expect(subject.connect(10).response['result_code']).
      to eq('SUCCESS')
  end
end
