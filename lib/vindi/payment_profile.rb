module Vindi
  class PaymentProfile < Base
    include Vindi::API::Create
    include Vindi::API::List
    include Vindi::API::Delete

  end
end
