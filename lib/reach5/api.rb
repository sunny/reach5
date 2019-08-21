# frozen_string_literal: true

module Reach5
  # Handles all calls to Reach5's API.
  class API
    # Get a new access token.
    #
    # Example:
    #     Reach5::API.new.get_access_token
    #     # => {
    #     #      "auth" => {
    #     #        "accessToken" => "f00b4r",
    #     #        "expires" => 43200
    #     #      },
    #     #      "status" => "success",
    #     #    }
    def get_access_token
      params = {
        client_key: Reach5.configuration.client_key,
        client_secret: Reach5.configuration.client_secret,
      }
      request = HTTP.get("#{host}/api/v1/access_token", params: params)
      request.parse
    end

    # Collects and stores profile data from an Auth provider.
    #
    # Example:
    #     Reach5::API.new.post_login(provider: 'facebook',
    #                                provider_token: 'f00b4r')
    #     # => {
    #     #      "profile" => {
    #     #        …
    #     #      },
    #     #      "status" => "success",
    #     #    }
    def post_login(provider:,
                   provider_token:,
                   provider_secret: nil,
                   user_agent: nil)

      params = {
        provider: provider,
        provider_token: provider_token,
        provider_secret: provider_secret,
      }

      request = HTTP
      request = request.headers("User-Agent": user_agent) if user_agent
      request = request.post("#{host}/api/v1/login", params: params)
      request.parse
    end

    # List profiles
    #
    # Example:
    #     Reach5::API.new.get_profiles
    #
    #     # => {
    #     #      "total" => 42,
    #     #      "items" => […],
    #     #      "status" => "success",
    #     #    }
    def get_profiles(page: 1, count: 10)
      params = {
        access_token: access_token,
        page: page,
        count: count,
      }
      HTTP.get("#{host}/api/v1/profile", params: params).parse
    end

    private

    def host
      "https://#{Reach5.configuration.customer_domain}"
    end

    def access_token
      @access_token ||= get_access_token.fetch("auth").fetch("accessToken")
    end
  end
end
