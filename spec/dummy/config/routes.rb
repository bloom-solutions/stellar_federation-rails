Rails.application.routes.draw do
  mount StellarFederation::Engine => "/stellar_federation"
end
