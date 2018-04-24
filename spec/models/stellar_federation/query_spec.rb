require "spec_helper"

module StellarFederation
  RSpec.describe Query do
    it "is a StellarFederation::Query" do
      response = described_class.new({
        address_id: "foo",
        address_domain: "bar.com",
        address_name: "foo*bar.com",
      })

      expect(response.address_id).to eq "foo"
      expect(response.address_domain).to eq "bar.com"
      expect(response.address_name).to eq "foo*bar.com"
    end
  end

end
