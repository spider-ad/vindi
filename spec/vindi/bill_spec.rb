require "spec_helper"

module Vindi
  describe Bill do

    describe ".create" do

      context "given a successful request" do
        let(:response) { parsed_response("customer.json") }

        before do
          allow_any_instance_of(Request).to receive(:perform).and_return(response)
        end

        let(:params) do
          {
            customer_id: 128008,
            payment_method_code: "credit_card",
            bill_items: [
              {
                product_id: 0,
                product_code: "01",
                amount: 1000,
                description: "Glass Master R$ 1000"
              }
            ],
            metadata: {}
          }
        end

        subject { described_class.create(params) }

        it { expect(subject).to be_a(Bill) }

      end
    end

  end
end




