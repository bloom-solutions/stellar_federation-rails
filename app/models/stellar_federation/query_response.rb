module StellarFederation
  class QueryResponse < BaseModel

    attribute :account_id, String
    attribute :memo, String
    attribute :stellar_address, String

    def memo_type
      "text"
    end

    def to_json
      {
        account_id: account_id,
        stellar_address: stellar_address,
        memo_type: memo_type,
        memo: memo,
      }.to_json
    end
  end
end
