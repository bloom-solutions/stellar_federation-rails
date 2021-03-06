module StellarFederation
  module Queries
    class TriggerOnQueryCallbackClass
      extend LightService::Action
      expects :query
      promises :query_response

      executed do |c|
        begin
          c.query_response = callback_class.(c.query)

          if c.query_response.present?
            if !c.query_response.is_a? StellarFederation::QueryResponse
              raise_return_error
            end
          end
        rescue NameError => e
          raise NameError, "StellarFederation.on_query isn't configured"
        end
      end

      private

      def self.callback_class
        StellarFederation.configuration.on_query.constantize
      end

      def self.raise_return_error
        raise(
          StandardError,
          [
            StellarFederation.configuration.on_query,
            "must return a StellarFederation::QueryResponse",
          ].join(" ")
        )
      end

    end
  end
end
