require "spec_helper"

module StellarFederation
  module Queries
    RSpec.describe PrepareOnQueryParameters do
      it "cleans parameters to be passed .on_query callback class" do
        params = { q: "test*bar.com", type: "text" }
        result = described_class.execute(query_params: params).query_params

        expect(result[:q]).to be_nil
        expect(result[:type]).to be_nil
        expect(result[:address_name]).to eq "test*bar.com"
      end
    end
  end
end
