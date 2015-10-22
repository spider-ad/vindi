require "spec_helper"

module Vindi
  describe URI do


    describe  "#to_s" do
      let(:path)   { "customers" }
      let(:format) { :json }

      context "given the customers path" do

        subject { described_class.new(path, format) }

        it "return the full url setting the format" do
          expect(subject.to_s).to eql("#{URI::BASE}customers.json")
        end
      end

      context "given the resource has an identifier" do

        subject { described_class.new(path, 3523, format) }

        it { expect(subject.to_s).to eql("#{URI::BASE}customers/3523.json") }

      end

    end

  end
end
