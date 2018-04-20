module StellarFederation
  class QueryResponse < BaseModel

    attribute :account_id, DryTypes::String.optional
    attribute :memo, DryTypes::String.optional
    attribute :stellar_address, DryTypes::String.optional
    attr_writer :memo, :account_id, :stellar_address

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
