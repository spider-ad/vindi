require "spec_helper"

module Vindi
  describe Request do
    let(:path) { 'customers' }
    let(:options) do
      {}
    end

    subject { described_class.new(request_method, path, options) }


    describe "#perfom" do
      let(:endpoint) do
        "https://app.vindi.com.br/api/v1/customers.json"
      end
      let(:resp_double) { instance_double("response", code: 200, parsed_response: "") }

      context "given a successful get request to customers" do
        let(:request_method) { :get }

        it "receive the get method with the default params" do
          expect(described_class).to receive(:get)
            .with(endpoint, query: {}).once.and_return(resp_double)
          subject.perform
        end

      end

      context "given a successful create customers" do
        let(:request_method) { :post }
        let(:options) do
          { name: "Bboy", country: "Brazil", email: "bboy@email.com" }
        end

        it "receive the post method with the default params" do
          expect(described_class).to receive(:post)
            .with(endpoint, body: options).once.and_return(resp_double)
          subject.perform
        end

      end

      context "given a successful request to update a resource" do
        let(:endpoint) do
          "https://app.vindi.com.br/api/v1/customers/3.json"
        end
        let(:request_method) { :put }
        let(:options) do
          { id: 3, email: "bboy@email.com" }
        end

        it "receive the put method with the default params" do
          expect(described_class).to receive(:put)
            .with(endpoint, body: options).once.and_return(resp_double)
          subject.perform
        end

      end

      context "given a successful request to get a single resource" do
        let(:endpoint) do
          "https://app.vindi.com.br/api/v1/customers/1.json"
        end
        let(:request_method) { :get }
        let(:options) do
          { id: 1 }
        end

        it "receive the get method with the default params" do
          expect(described_class).to receive(:get)
            .with(endpoint, query: options).once.and_return(resp_double)
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
