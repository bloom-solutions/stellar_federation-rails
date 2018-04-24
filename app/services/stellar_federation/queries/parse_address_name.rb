module StellarFederation
  module Queries
    class ParseAddressName
      extend LightService::Action
      expects :query_params
      promises :query

      executed do |c|
        address_name = c.query_params[:address_name]
        split_address_name = address_name.split("*")
        c.query = Query.new(
          address_id: split_address_name[0],
          address_domain: split_address_name[1],
          address_name: address_name,
        )
      end
    end
  end
end
