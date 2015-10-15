require "spec_helper"

module Vindi
  describe Request do
    let(:path) { 'customers' }

    subject { described_class.new(request_method, path) }


    describe "#perfom" do
      let(:endpoint) do
        "https://app.vindi.com.br/api/v1/customers.json"
      end

      context "given a successful get request to customers" do
        let(:request_method) { :get }
        let(:default_params) do
          { query: { } }
        end

        it "receive the get method with the default params" do
          expect(described_class).to receive(:get)
            .with(endpoint, default_params).once
          subject.perform
        end

      end

      context "given a successful create customers" do
        let(:request_method) { :post }
        let(:default_params) do
          { body: { } }
        end

        it "receive the get method with the default params" do
          expect(described_class).to receive(:post)
            .with(endpoint, default_params).once
          subject.perform
        end

      end

    end

    describe "#uri" do
      let(:endpoint) do
        "https://app.vindi.com.br/api/v1/discounts.json"
      end

      context "given a resource name" do

        subject { described_class.new(:get, 'discounts') }

        it "returns the api path to that resource json" do
          expect(subject.uri.to_s).to be_eql endpoint
        end
      end

    end

  end
end
