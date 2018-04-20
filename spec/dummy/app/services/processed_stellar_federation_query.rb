class ProcessedStellarFederationQuery

  def self.call(opts = {})
    StellarFederation::QueryResponse.new(
      stellar_address: opts[:stellar_address],
      account_id: "FOOBAR",
      memo: 1,
    )
  end

end

