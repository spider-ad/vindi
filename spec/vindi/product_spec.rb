require "pry"
require "spec_helper"

module Vindi
  describe Product do

    describe ".all" do

      context "given a successful request" do
        let(:response) { parsed_response("products.json") }

        before do
          allow_any_instance_of(Request).to receive(:perform).and_return(response)
        end

        subject { described_class.all }

        it { expect(subject).to be_a(Array) }

        it { expect(subject.first).to be_a(Product) }

      end
    end

    describe ".create" do

      context "given a successful request" do
        let(:response) { parsed_response("product.json") }

        before do
          allow_any_instance_of(Request).to receive(:perform).and_return(response)
        end

        let(:product) do
          {
            name: "Glass",
            code: "01",
            unit: "",
            status: "",
            description: "",
            pricing_schema: {
              price: 1,
              minimum_price: 0,
              schema_type: "",
              pricing_ranges: [
                {
                  start_quantity: 0,
                  end_quantity: 0,
                  price: 0,
                  overage_price: 0
                }
              ]
            },
            metadata: {}
          }
        end

        subject { described_class.create(product) }

        it { expect(subject).to be_a(Product) }

        it { expect(subject.name).to be_eql product[:name] }
      end
    end


    describe ".update" do

      context "given a successful request" do
        let(:response) { parsed_response("product.json") }

        before do
          response['product']['name'] = name
          allow_any_instance_of(Request).to receive(:perform).and_return(response)
        end

        let(:id) { 8641 }
        let(:name) { 'Glass V2' }

        subject { described_class.update(id: id, name: name) }

        it { expect(subject).to be_a(Product) }

        it { expect(subject.id).to be_eql id }

        it { expect(subject.name).to be_eql name }
      end
    end

    describe ".find" do

      context "given a successful request" do
        let(:response) { parsed_response("product.json") }

        before do
          allow_any_instance_of(Request).to receive(:perform).and_return(response)
        end

        let(:id) { 8641 }

        subject { described_class.find(id: id) }

        it { expect(subject).to be_a(Product) }

        it { expect(subject.id).to be_eql id }

      end
    end

  end
end
