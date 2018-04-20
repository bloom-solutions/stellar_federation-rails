require "spec_helper"

RSpec.describe "/api/v1/queries", type: :request do
  let(:uri) do
    StellarFederation::Engine.routes.url_helpers.api_v1_queries_url
  end

  context "invalid parameters" do
    let(:invalid_params) { { t: "test"} }
    it "returns 422" do
      get(uri, { params: invalid_params })

      expect(response.success?).to eq false
      expect(response.status).to eq 422

      json = JSON.parse(response.body)
      expect(json["message"]).to eq "Invalid Parameters"
      expect(json["status"]).to eq "Unprocessable Entity"
    end
  end

  context "valid parameters" do
    let(:valid_params) { { q: "foo*bar.com", type: "name" } }

    before do
      StellarFederation.configure do |c|
        c.on_query = "ProcessedStellarFederationQuery"
      end
    end

    after do
      StellarFederation.configure do |c|
        c.on_query = "ProcessStellarFederationQuery"
      end
    end

    it "returns 200 and response object" do
      get(uri, { params: valid_params })

      expect(response).to be_success
      expect(response.status).to eq 200

      json = JSON.parse(response.body)
      expect(json["stellar_address"]).to eq "foo*bar.com"
      expect(json["account_id"]).to eq "FOOBAR"
      expect(json["memo_type"]).to eq "text"
      expect(json["memo"]).to eq 1
    end
  end
end