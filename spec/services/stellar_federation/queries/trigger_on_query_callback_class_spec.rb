require "spec_helper"

module StellarFederation
  module Queries
    RSpec.describe TriggerOnQueryCallbackClass do
      let(:query) { Query.new(address_id: "foo") }

      context "with configured callback class" do
        let(:query_response) { QueryResponse.new }

        it "triggers the configured callback class" do
          expect(ProcessStellarFederationQuery).to receive(:call)
            .with(query).and_return(query_response)
          described_class.execute(query: query)
        end
      end

      context "with configured callback class and doesnt return QueryResponse" do
        it "triggers the configured callback class" do
          expect(ProcessStellarFederationQuery).to receive(:call)
            .with(query).and_return("test")

          expect { described_class.execute(query: query) }.to raise_error(
            StandardError,
            "ProcessStellarFederationQuery must return a StellarFederation::QueryResponse"
          )
        end
      end

      context "without configured callback class" do
        let(:query) { Query.new(address_id: "foo") }

        before do
          StellarFederation.configure do |c|
            c.on_query = ""
          end
        end

        after do
          StellarFederation.configure do |c|
            c.on_query = "ProcessStellarFederationQuery"
          end
        end

        it "fails and returns an error" do
          expect { described_class.execute(query: query) }.to raise_error(
            NameError,
            "StellarFederation.on_query isn't configured",
          )
        end
      end

    end
  end
end

