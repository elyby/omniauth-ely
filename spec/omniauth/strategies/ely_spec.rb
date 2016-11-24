require 'spec_helper'

describe OmniAuth::Strategies::Ely do
  let(:access_token) { stub('AccessToken', :options => {}) }
  let(:parsed_response) { stub('ParsedResponse') }
  let(:response) { stub('Response', :parsed => parsed_response) }

  subject do
    OmniAuth::Strategies::Ely.new({})
  end

  before(:each) do
    subject.stub!(:access_token).and_return(access_token)
  end

  context 'client options' do
    it 'should have correct site' do
      subject.options.client_options.site.should eq('https://account.ely.by')
    end

    it 'should have correct authorize url' do
      subject.options.client_options.authorize_url.should eq('https://account.ely.by/oauth2/v1/')
    end

    it 'should have correct token url' do
      subject.options.client_options.token_url.should eq('https://account.ely.by/api/oauth2/v1/token')
    end
  end

  context '#raw_info' do
    it 'should use relative paths' do
      access_token.should_receive(:get).and_return(response)
      subject.raw_info.should eq(parsed_response)
    end

    it 'should build valid profile link' do
      raw_info = Hash.new
      raw_info['id'] = 1
      subject.stub!(:raw_info).and_return(raw_info)
      subject.profile_url.should eq('http://ely.by/u1')
    end

    it 'should build valid skin link' do
      raw_info = Hash.new
      raw_info['username'] = 'Steve'
      subject.stub!(:raw_info).and_return(raw_info)
      subject.skin_url.should eq('http://skinsystem.ely.by/skins/Steve.png')
    end
  end
end
