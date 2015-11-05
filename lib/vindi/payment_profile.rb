module Vindi
  class PaymentProfile < Base
    include Vindi::API::Create
    include Vindi::API::List

  end
end
