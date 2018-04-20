require "spec_helper"

module StellarFederation
  module Queries
    RSpec.describe TriggerOnQueryCallbackClass do

      context "with configured callback class" do
        let(:query_response) { QueryResponse.new }
        it "triggers the configured callback class" do
          expect(ProcessStellarFederationQuery).to receive(:call)
            .with(address_name: 'foo').and_return(query_response)
          described_class.execute(query_params: { address_name: "foo" })
        end
      end

      context "with configured callback class and doesnt return QueryResponse" do
        it "triggers the configured callback class" do
          expect(ProcessStellarFederationQuery).to receive(:call)
            .with(address_name: 'foo').and_return("test")

          expect {
            described_class.execute(query_params: { address_name: "foo" })
          }.to raise_error(
            StandardError,
            "ProcessStellarFederationQuery must return a StellarFederation::QueryResponse"
          )
        end
      end

      context "without configured callback class" do
        it "fails and returns an error" do
          StellarFederation.configure do |c|
            c.on_query = ""
          end

          expect {
            described_class.execute(query_params: { address_name: "foo" })
          }.to raise_error(
            NameError,
            "StellarFederation.on_query isn't configured",
          )
        end
      end

    end
  end
end

