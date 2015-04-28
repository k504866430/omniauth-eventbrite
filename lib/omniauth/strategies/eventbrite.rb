require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Eventbrite < OmniAuth::Strategies::OAuth2
      DEFAULT_RESPONSE_TYPE = 'code'
      DEFAULT_GRANT = 'authorization_code'

      option :name, 'eventbrite'
      option :client_options, site: 'https://www.eventbrite.com',
                              authorize_url: '/oauth/authorize',
                              token_url: '/oauth/token'

      uid { raw_info['user_id'].to_s }

      def authorize_params
        super.tap do |params|
          params[:response_type] ||= DEFAULT_RESPONSE_TYPE
          params[:client_id] = client.id
        end
      end

      def token_params
        super.tap do |params|
          params[:grant_type] ||= DEFAULT_GRANT
          params[:client_id] = client.id
          params[:client_secret] = client.secret
        end
      end

      info do
        prune!('email' => raw_info['email'],
               'name' => full_name,
               'first_name' => raw_info['first_name'],
               'last_name' => raw_info['last_name'])
      end

      extra do
        prune!('raw_info' => raw_info)
      end

      def raw_info
        @raw_info ||= access_token.get('/json/user_get').parsed['user'] || {}
      end

      private

      def full_name
        first_name = raw_info['first_name'] || ''
        last_name = raw_info['last_name'] || ''

        "#{first_name} #{last_name}" || nil
      end

      def prune!(hash)
        hash.delete_if do |_, value|
          prune!(value) if value.is_a?(Hash)
          value.nil? || (value.respond_to?(:empty?) && value.empty?)
        end
      end
    end
  end
end

OmniAuth.config.add_camelization 'eventbrite', 'Eventbrite'
