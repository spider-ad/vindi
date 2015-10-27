require "spec_helper"

module Vindi
  describe PaymentMethod do

    describe ".all" do

      context "given a successful request" do
        let(:response) { parsed_response("payment_methods.json") }

        before do
          allow_any_instance_of(Request).to receive(:perform).and_return(response)
        end

        subject { described_class.all }

        it { expect(subject).to be_a(Array) }

        it { expect(subject.first).to be_a(PaymentMethod) }

      end
    end


    describe ".find" do

      context "given a successful request" do
        let(:response) { parsed_response("payment_method.json") }

        before do
          allow_any_instance_of(Request).to receive(:perform).and_return(response)
        end

        let(:id) { 3510 }

        subject { described_class.find(id: id) }

        it { expect(subject).to be_a(PaymentMethod) }

        it { expect(subject.id).to be_eql id }

      end
    end

  end
end
