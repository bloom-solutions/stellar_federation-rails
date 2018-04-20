module StellarFederation
  module Queries
    class PrepareOnQueryParameters
      extend LightService::Action
      expects :query_params

      executed do |c|
        c.query_params[:address_name] = c.query_params[:q]
        c.query_params.except!(:q, :type)
      end
    end
  end
end
