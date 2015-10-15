require "spec_helper"

module Vindi
  describe Customer do

    describe ".all" do

      context "given a successful request" do
        let(:response) { parsed_response("customers.json") }

        before do
          allow_any_instance_of(Request).to receive(:perform).and_return(response)
        end

        subject { described_class.all }

        it { expect(subject).to be_a(Array) }

        it { expect(subject.first).to be_a(Customer) }

      end
    end

    describe ".create" do

      context "given a successful request" do
        let(:response) { parsed_response("customer.json") }

        before do
          allow_any_instance_of(Request).to receive(:perform).and_return(response)
        end

        let(:client) do
          {
            name: "Heisenberg",
            email: "hein@email.com",
            registration_code: 99,
            address: {
              city: "Sao Paulo",
              state: "SP",
              country: "BR"
            }
          }
        end

        subject { described_class.create(client) }

        it { expect(subject).to be_a(Customer) }

        it { expect(subject.name).to be_eql client[:name] }
      end
    end

  end
end
