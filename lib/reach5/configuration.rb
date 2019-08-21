# frozen_string_literal: true

# Configure Reach5
module Reach5
  # Global configuration for API calls.
  class Configuration
    attr_accessor :customer_domain
    attr_accessor :client_key
    attr_accessor :client_secret

    def initialize
      @customer_domain = "NO_CUSTOMER_DOMAIN_SET"
      @client_key = "NO_CLIENT_KEY_SET"
      @client_secret = "NO_SECRET_ACCESS_TOKEN_SET"
    end
  end

  class << self
    attr_accessor :configuration
  end

  def self.configure(&block)
    (self.configuration ||= Configuration.new).tap(&block)
  end
end
