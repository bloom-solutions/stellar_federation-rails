module StellarFederation
  module Api
    module V1
      class QueriesController < ApplicationController
        before_filter :set_cors_headers, only: %i[index]

        def index
          result = Queries::ProcessQuery.(query_params: query_params)

          respond_to do |format|
            format.json do
              if result.success?
                @query_response = result.query_response

                if @query_response.present?
                  render json: @query_response.to_json, status: :ok
                else
                  render json: @query_response.to_json, status: :not_found
                end
              else
                json_status = { details: result.message }

                render json: json_status, status: :unprocessable_entity
              end
            end
          end

        end

        private

        def query_params
          params.permit(:q, :type).to_hash.with_indifferent_access
        end

        def set_cors_headers
          response.headers["Access-Control-Allow-Origin"] = "*"
        end
      end
    end
  end
end
