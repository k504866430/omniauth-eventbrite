require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Eventbrite < OmniAuth::Strategies::OAuth2
      DEFAULT_RESPONSE_TYPE = 'code'
      DEFAULT_GRANT = 'authorization_code'
      INFO_URL = 'https://www.eventbriteapi.com/v3/users/me/'.freeze

      option :name, 'eventbrite'

      # The list of optional values that can be sent with authorize
      #
      # @note :ref is a referral code for the Referral Program.
      option :authorize_options, [:ref]
      option :client_options, site: 'https://www.eventbrite.com',
                              authorize_url: '/oauth/authorize',
                              token_url: '/oauth/token'

      uid { raw_info['id'].to_s }

      info do
        prune!('email' => retrieved_email,
               'name' => raw_info['name'],
               'first_name' => raw_info['first_name'],
               'last_name' => raw_info['last_name'])
      end

      extra do
        prune!('raw_info' => raw_info)
      end

      # The OAuth2 client authorization parameters.
      #
      # @return [OmniAuth::Strategy::Options]
      def authorize_params
        super.tap do |params|
          params[:response_type] ||= DEFAULT_RESPONSE_TYPE
          params[:client_id] = client.id
        end
      end

      # Unfiltered data about the authenticating user.
      #
      # @return [Hash]
      def raw_info
        @raw_info ||= access_token.get(INFO_URL).parsed || {}
      end

      # The OAuth2 client authentication parameters.
      #
      # @return [OmniAuth::Strategy::Options]
      def token_params
        super.tap do |params|
          params[:grant_type] ||= DEFAULT_GRANT
          params[:client_id] = client.id
          params[:client_secret] = client.secret
        end
      end

      private

      def full_name
        first_name = raw_info['first_name'] || ''
        last_name = raw_info['last_name'] || ''

        "#{first_name} #{last_name}".strip || nil
      end

      def prune!(hash)
        hash.delete_if do |_, value|
          prune!(value) if value.is_a?(Hash)
          value.nil? || (value.respond_to?(:empty?) && value.empty?)
        end
      end

      def retrieved_email
        primary = raw_info['emails'].detect { |e| e['primary'] }
        primary ||= raw_info['emails'].first
        primary['email']
      end
    end
  end
end

OmniAuth.config.add_camelization 'eventbrite', 'Eventbrite'
