module StellarFederation
  module Api
    module V1
      class QueriesController < ApplicationController
        def index
          check_parameters = Queries::CheckParameters.(params)

          if check_parameters
            @query_response = Queries::ProcessQuery.(query_params: params)
              .query_response
            respond_to do |format|
              format.json do
                render json: @query_response.to_json, status: :ok
              end
            end
          else
            respond_to do |format|
              format.json do
                render(
                  json: {
                    status: "Unprocessable Entity",
                    message: "Invalid Parameters",
                  },
                  status: :unprocessable_entity,
                )
              end
            end
          end
        end
      end
    end
  end
end
