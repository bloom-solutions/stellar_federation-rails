module StellarFederation
  module Queries
    class ProcessQuery
      extend LightService::Organizer

      def self.call(query_params:)
        with(query_params: query_params).reduce(
          CheckParameters,
          PrepareOnQueryParameters,
          ParseAddressName,
          TriggerOnQueryCallbackClass,
        )
      end
    end
  end
end
