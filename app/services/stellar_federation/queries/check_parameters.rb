module StellarFederation
  module Queries
    class CheckParameters
      extend LightService::Action
      expects :query_params

      executed do |c|
        unless c.query_params[:q].present? && check_type(c.query_params[:type])
          c.fail! "Invalid Parameters"
        end
      end

      private

      def self.check_type(type)
        type.present? && type == "name"
      end

    end
  end
end
