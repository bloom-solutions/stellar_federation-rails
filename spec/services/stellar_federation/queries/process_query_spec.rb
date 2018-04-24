require "spec_helper"

module StellarFederation
  module Queries
    RSpec.describe ProcessQuery do
      it "processes a query on the federation server" do
        actions = [
          CheckParameters,
          PrepareOnQueryParameters,
          ParseAddressName,
          TriggerOnQueryCallbackClass,
        ]

        params = { q: "foo*bar.com" }
        ctx = LightService::Context.new(query_params: params)

        actions.each do |action|
          expect(action).to receive(:execute).with(ctx).and_return(ctx)
        end

        described_class.(query_params: params)
      end
    end
  end
end
