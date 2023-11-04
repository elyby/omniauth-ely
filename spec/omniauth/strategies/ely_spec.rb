require 'spec_helper'

describe OmniAuth::Strategies::Ely do
  let(:access_token) { double('AccessToken', :options => {}) }
  let(:parsed_response) { double('ParsedResponse') }
  let(:response) { double('Response', :parsed => parsed_response) }

  subject do
    OmniAuth::Strategies::Ely.new({})
  end

  before(:each) do
    allow(subject).to receive(:access_token).and_return(access_token)
  end

  context 'client options' do
    it 'should have correct site' do
      expect(subject.options.client_options.site).to eq('https://account.ely.by')
    end

    it 'should have correct authorize url' do
      expect(subject.options.client_options.authorize_url).to eq('https://account.ely.by/oauth2/v1/')
    end

    it 'should have correct token url' do
      expect(subject.options.client_options.token_url).to eq('https://account.ely.by/api/oauth2/v1/token')
    end
  end

  context '#raw_info' do
    it 'should use relative paths' do
      expect(access_token).to receive(:get).and_return(response)
      expect(subject.raw_info).to eq(parsed_response)
    end

    it 'should build valid profile link' do
      raw_info = Hash.new
      raw_info['id'] = 1
      allow(subject).to receive(:raw_info).and_return(raw_info)
      expect(subject.profile_url).to eq('https://ely.by/u1')
    end

    it 'should build valid skin link' do
      raw_info = Hash.new
      raw_info['username'] = 'Steve'
      allow(subject).to receive(:raw_info).and_return(raw_info)
      expect(subject.skin_url).to eq('http://skinsystem.ely.by/skins/Steve.png')
    end
  end
end
