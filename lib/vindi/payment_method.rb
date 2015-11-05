module Vindi
  class PaymentMethod < Base
    include Vindi::API::List
    include Vindi::API::Get

  end
end
