module StellarFederation
  class Query < BaseModel

    attribute :address_id, DryTypes::String.optional
    attribute :address_domain, DryTypes::String.optional
    attribute :address_name, DryTypes::String.optional
  end
end
