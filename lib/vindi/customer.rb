module Vindi
  class Customer < Base
    include Vindi::API::Create
    include Vindi::API::List
    include Vindi::API::Delete
    include Vindi::API::Update
    include Vindi::API::Get

  end
end
