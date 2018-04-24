module StellarFederation
  module Api
    module V1
      class QueriesController < ApplicationController
        def index
          result = Queries::ProcessQuery.(query_params: query_params)

          respond_to do |format|
            format.json do
              if result.success?
                @query_response = result.query_response

                render json: @query_response.to_json, status: :ok
              else
                json_status = {
                  status: "Unprocessable Entity",
                  message: result.message,
                }

                render json: json_status, status: :unprocessable_entity
              end
            end
          end

        end

        private

        def query_params
          params.permit(:q, :type).to_hash.with_indifferent_access
        end
      end
    end
  end
end
