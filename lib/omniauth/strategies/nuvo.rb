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
        result = {
          :first_name => raw_info['first_name'],
          :last_name => raw_info['last_name'],
          :email => raw_info['email'],
          :image => raw_info['profile_image_url'],
        }
        result[:locale] = {}
        raw_info['locale'].each do |locale, locale_info|
          result[:locale][locale] = {
            :first_name => locale_info['first_name'],
            :last_name => locale_info['last_name'],
            :name => locale_info['name'],
          }
        end
        result
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v2/users/me.json').parsed
      end
    end
  end
end