require "spec_helper"

module Vindi
  describe PaymentProfile do

    describe ".create" do

      context "given a good request to create a payment profile with credit card" do
        let(:params) do
          {
            holder_name: "Heinsberg Silva Junior",
            card_expiration: "12/2018",
            card_number: "5167454851671773",
            card_cvv: "123",
            payment_method_code: "credit_card",
            payment_company_code: "mastercard",
            customer_id: 128008
          }
        end

        let(:response) { parsed_response("payment_profile.json") }

        before do
          allow_any_instance_of(Request).to receive(:perform).and_return(response)
        end

        subject { described_class.create(params) }


        it { expect(subject).to be_a(PaymentProfile) }

        it { expect(subject.holder_name).to be_eql(params[:holder_name]) }
      end

    end

    describe ".all" do

      context "given a good request to create a payment profile with credit card" do

        let(:response) { parsed_response("payment_profiles.json") }

        before do
          allow_any_instance_of(Request).to receive(:perform).and_return(response)
        end

        subject { described_class.all }


        it { expect(subject).to be_a(Array) }

        it { expect(subject.first).to be_a(PaymentProfile) }

      end

    end

  end
end
