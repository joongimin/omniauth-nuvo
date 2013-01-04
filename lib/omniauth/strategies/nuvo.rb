require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Nuvo < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site => 'https://api.xnuvo.com',
        :authorize_path => '/login/oauth/authorize',
        :token_path => '/login/oauth/access_token'
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

      extra do
        { :raw_info => raw_info }
      end

      def raw_info
        access_token.options[:mode] = :query
        @raw_info ||= access_token.get('/user').parsed
      end
    end
  end
end