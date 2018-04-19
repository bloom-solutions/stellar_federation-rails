module StellarFederation
  module Queries
    class CheckParameters
      def self.call(params)
        params[:q].present? && check_type(params[:type])
      end

      private

      def self.check_type(type)
        type.present? && type == "name"
      end

    end
  end
end
