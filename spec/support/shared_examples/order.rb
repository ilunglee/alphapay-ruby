require 'spec_helper'

shared_examples 'an order' do
  it 'should throw an error if the partner_code is nil' do
    allow(AlphaPay).to receive(:partner_code) { nil }
    expect { subject }.
      to raise_error(AlphaPay::Exceptions::KeyMissingError,
                     'missing credential_code && partner_code')
  end

  it 'should throw an error if the credential_code is nil' do
    allow(AlphaPay).to receive(:credential_code) { nil }
    expect { subject }.
      to raise_error(AlphaPay::Exceptions::KeyMissingError,
                     'missing credential_code && partner_code')
  end

  describe 'should response with INVALID', vcr: true do
    it do
      allow(AlphaPay).to receive(:partner_code) { 'bad_code' }
      allow(AlphaPay).to receive(:credential_code) { 'bad_code' }
      expect(subject.connect.response['return_code']).
        to eq('INVALID_SHORT_ID')
    end
  end

  describe 'returns success', vcr: true do
    it do
      expect(subject.connect.response['result_code']).
        to eq('SUCCESS')
    end
  end
end
