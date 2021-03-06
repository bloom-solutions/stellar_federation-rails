require "gem_config"
require "light-service"
require "virtus"
require "stellar_federation/engine"

module StellarFederation
  include GemConfig::Base

  with_configuration do
    has :on_query
  end
end

