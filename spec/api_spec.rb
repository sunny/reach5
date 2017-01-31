require "spec_helper"

module Reach5
  describe API do
    subject(:api) { described_class.new }

    describe "#get_access_token" do
      it "returns a hash" do
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
      let(:args) {
        {
          provider: "facebook",
          provider_token: "t0k3n",
        }
      }
      let(:stub_url) {
        "https://example.com/api/v1/login" \
        "?provider=facebook" \
        "&provider_secret=" \
        "&provider_token=t0k3n"
      }
      let(:stub_response) {
        {
          status: 200,
          body: '{"profile":{"foo":"bar"},"status":"success"}',
          headers: { "Content-Type" => "application/json" },
        }
      }

      let(:expected_return) {
        {
          "profile" => { "foo" => "bar" },
          "status" => "success",
        }
      }

      it "returns a hash" do
        stub_request(:post, stub_url)
          .to_return(stub_response)

        expect(api.post_login(args)).to eq(expected_return)
      end

      context "with a user agent" do
        let(:args) {
          {
            provider: "facebook",
            provider_token: "t0k3n",
            user_agent: "Mozillas & such",
          }
        }

        it "adds it in the headers" do
          stub_request(:post, stub_url)
            .with(headers: { "User-Agent" => "Mozillas & such" })
            .to_return(stub_response)

          expect(api.post_login(args)).to eq(expected_return)
        end
      end
    end
  end
end
