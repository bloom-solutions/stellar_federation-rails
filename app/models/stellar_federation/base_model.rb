module StellarFederation
  module DryTypes
    include Dry::Types.module
  end

  class BaseModel < Dry::Struct
    constructor_type :schema
  end
end
