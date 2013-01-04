require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Nuvo < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site => 'https://api.xnuvo.com',
        :authorize_path => '/oauth/authorize'
      }

      uid { raw_info['id'].to_s }

      info do
        {
          :first_name => raw_info['first_name'],
          :last_name => raw_info['last_name'],
          :email => raw_info['email'],
          :name => raw_info['name'],
          :image => raw_info['profile_image_url']
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v2/users/me.json').parsed
      end
    end
  end
end