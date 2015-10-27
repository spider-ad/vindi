module Vindi
  class PaymentProfile < Base
    include Vindi::API::Create
    include Vindi::API::List


    protected

    def self.key_parser
      resource_name
    end

    def self.reponse_has_key?
      true
    end

  end
end
