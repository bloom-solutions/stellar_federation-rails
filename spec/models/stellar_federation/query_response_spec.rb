require "spec_helper"

module StellarFederation
  RSpec.describe QueryResponse do
    it "is a StellarFederationResponse" do
      response = described_class.new({
        account_id: "GABC",
        stellar_address: "foo*bar.com",
        memo: "123",
      })

      expect(response.account_id).to eq "GABC"
      expect(response.stellar_address).to eq "foo*bar.com"
      expect(response.memo).to eq "123"
    end

    it "has readers/writers" do
      response = described_class.new

      expect(response.memo_type).to eq "text"

      response.account_id = "GABCSD"
      expect(response.account_id).to eq "GABCSD"

      response.stellar_address = "foo*bar.com"
      expect(response.stellar_address).to eq "foo*bar.com"

      response.memo = "123"
      expect(response.memo).to eq "123"
    end
  end

end
