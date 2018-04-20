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
end
