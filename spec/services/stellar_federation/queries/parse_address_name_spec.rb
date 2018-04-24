require "spec_helper"

module StellarFederation
  module Queries
    RSpec.describe ParseAddressName do
      it "splits the address_name into 2 parts: id and domain" do
        query_params = { address_name: "foo*bar.com" }
        result = described_class.execute(query_params: query_params)

        expect(result.query.address_id).to eq "foo"
        expect(result.query.address_domain).to eq "bar.com"
        expect(result.query.address_name).to eq "foo*bar.com"
      end
    end
  end
end
