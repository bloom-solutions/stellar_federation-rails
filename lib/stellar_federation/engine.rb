module StellarFederation
  class Engine < ::Rails::Engine
    isolate_namespace StellarFederation

    config.to_prepare do
      Engine.routes.default_url_options =
        Rails.application.routes.default_url_options
    end

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
