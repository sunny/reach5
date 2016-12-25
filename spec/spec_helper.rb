$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "reach5"

require "webmock/rspec"
WebMock.disable_net_connect!

Reach5.configure do |c|
  c.customer_domain = "example.com"
  c.client_key = "cl1ntk3y"
  c.client_secret = "s3cr3tk3y"
end
