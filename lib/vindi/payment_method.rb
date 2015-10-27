module Vindi
  class PaymentMethod < Base
    include Vindi::API::List
    include Vindi::API::Get


    protected

    def self.key_parser
      resource_name
    end

    def self.reponse_has_key?
      true
    end

  end
end
