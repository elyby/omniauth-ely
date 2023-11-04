require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Ely < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site => 'https://account.ely.by',
        :authorize_url => 'https://account.ely.by/oauth2/v1/',
        :token_url => 'https://account.ely.by/api/oauth2/v1/token',
      }

      uid { raw_info['id'].to_s }

      info do
        {
          :name => raw_info['username'],
          :email => raw_info['email'],
          :urls => {
            :Ely => profile_url,
            :Skin => skin_url,
          },
        }
      end

      extra do
        {
          :raw_info => raw_info,
          :uuid => raw_info['uuid'],
          :registered_at => raw_info['registeredAt'],
          :preferred_language => raw_info['preferredLanguage']
        }
      end

      def raw_info
        @raw_info ||= access_token.get('https://account.ely.by/api/account/v1/info').parsed
      end

      def skin_url
        'http://skinsystem.ely.by/skins/' + raw_info['username'] + '.png'
      end

      def profile_url
        'https://ely.by/u' + raw_info['id'].to_s
      end

      def callback_url
        options[:redirect_uri] || (full_host + script_name + callback_path)
      end
    end
  end
end

OmniAuth.config.add_camelization 'ely', 'Ely'
