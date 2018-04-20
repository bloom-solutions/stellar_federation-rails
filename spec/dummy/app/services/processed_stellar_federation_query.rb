class ProcessedStellarFederationQuery

  def self.call(opts = {})
    StellarFederation::QueryResponse.new(
      stellar_address: opts[:address_name],
      account_id: "FOOBAR",
      memo: 1,
    )
  end

end

