require "spec_helper"

describe Vindi do

  describe "#api_key" do
    let(:key) { "121312dsasdas" }

    context "given a block to configure api_key" do

      before do
        Vindi.configure { |c| c.api_key = key }
      end

      it { expect(subject.api_key).to be_eql key }

    end

    context "given the api key attr accessor" do
      let(:key) { "21312321" }

      before do
        Vindi.api_key = key
      end

      it { expect(subject.api_key).to be_eql key }

    end

  end


end
