require "spec_helper"

module StellarFederation
  module Queries
    RSpec.describe CheckParameters do
      describe ".call" do
        let(:ctx) { { query_params: query_params } }

        context "q is not present" do
          let(:query_params) { { type: "name"} }

          it "returns false" do
            expect(described_class.execute(ctx).success?).to eq false
          end
        end

        context "type is not present" do
          let(:query_params) { { q: "name"} }

          it "returns false" do
            expect(described_class.execute(ctx).success?).to eq false
          end
        end

        context "type is not 'name'" do
          let(:query_params) { { type: "foo"} }

          it "returns false" do
            expect(described_class.execute(ctx).success?).to eq false
          end
        end

        context "parameters are present" do
          let(:query_params) { { q: "bar", type: "name" } }

          it "returns true" do
            expect(described_class.execute(ctx).success?).to eq true
          end
        end
      end

    end

  end
end
