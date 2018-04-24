class ProcessStellarFederationQuery

  def self.call(query)
    Rails.logger.info "Woot got a federation query #{query.to_hash}"
  end

end

