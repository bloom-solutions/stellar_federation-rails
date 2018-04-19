module StellarFederation
  class Engine < ::Rails::Engine
    isolate_namespace StellarFederation

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
