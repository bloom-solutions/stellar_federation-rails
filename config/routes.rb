StellarFederation::Engine.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :queries, only: [:index], defaults: { format: "json" }
    end
  end
end
