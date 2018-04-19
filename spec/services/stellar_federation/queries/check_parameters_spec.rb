require "spec_helper"

module StellarFederation
  module Queries
    RSpec.describe CheckParameters do
      describe ".call" do
        context "q is not present" do
          it "returns false" do
            expect(described_class.({ type: "name" })).to eq false
          end
        end

        context "type is not present" do
          it "returns false" do
            expect(described_class.({ q: "name" })).to eq false
          end
        end

        context "type is not 'name'" do
          it "returns false" do
            expect(described_class.({ type: "foo" })).to eq false
          end
        end

        context "parameters are present" do
          it "returns true" do
            expect(
              described_class.({ q: "bar", type: "name" })).to eq true
          end
        end
      end

    end

  end
end
