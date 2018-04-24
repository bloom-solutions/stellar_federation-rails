class ProcessedStellarFederationQuery

  def self.call(query)
    StellarFederation::QueryResponse.new(
      stellar_address: query.address_name,
      account_id: "FOOBAR",
      memo: 1,
    )
  end

end

