require "spec_helper"

module Reach5
  describe API do
    subject(:api) { described_class.new }

    describe "#get_access_token" do
      it do
        stub_request(:get, "https://example.com/api/v1/access_token" \
                           "?client_key=cl1ntk3y&client_secret=s3cr3tk3y")
          .to_return(status: 200,
                     body: '{"auth":{"accessToken":"f00b4r","expires":43200},' \
                           '"status":"success"}',
                     headers: { "Content-Type" => "application/json" })

        expected_response = {
          "auth" => { "accessToken" => "f00b4r", "expires" => 43_200 },
          "status" => "success",
        }
        expect(api.get_access_token).to eq(expected_response)
      end
    end

    describe "#post_login" do
      it do
        stub_request(:post, "https://example.com/api/v1/login" \
                            "?provider=facebook" \
                            "&provider_secret=" \
                            "&provider_token=t0k3n")
          .to_return(status: 200,
                     body: '{"profile":{"foo":"bar"},' \
                           '"status":"success"}',
                     headers: { "Content-Type" => "application/json" })

        query = {
          provider: "facebook",
          provider_token: "t0k3n",
        }
        expected_response = {
          "profile" => { "foo" => "bar" },
          "status" => "success",
        }
        expect(api.post_login(query)).to eq(expected_response)
      end
    end
  end
end
