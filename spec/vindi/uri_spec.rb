require "spec_helper"

module Vindi
  describe URI do

    subject { described_class.new(path, format) }

    describe  "#to_s" do
      let(:path)   { "customers" }
      let(:format) { :json }

      context "given the customers path" do

        it "return the full url setting the format" do
          expect(subject.to_s).to eql("#{URI::BASE}customers.json")
        end
      end

    end

  end
end
