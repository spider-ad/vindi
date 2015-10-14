require "spec_helper"

module Vindi
  describe Request do

    let(:path)           { '/customers' }
    let(:request_method) { :get        }
    let(:default_params) do
      { query: {format: "json"} }
    end

    subject { described_class.new(request_method, path) }


    describe "#perfom" do
      let(:endpoint) do
        "https://app.vindi.com.br/api/v1/customers"
      end

      context "given a successful get request to customers" do
        let(:http_response) do
          double("response", code: 200)
        end

        it "receive the get method with the default params" do
          expect(described_class).to receive(:get)
            .with(endpoint, default_params).once
          subject.perform
        end

      end

    end

    describe "#options" do

      context "given the format isnt send as a param" do

        it "returns the default json format" do
          expect(subject.options[:format]).to eql("json")
        end
      end

    end

  end
end
