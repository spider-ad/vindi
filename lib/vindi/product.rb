module Vindi
  class Product < Base
    include Vindi::API::Create
    include Vindi::API::List
    include Vindi::API::Update
    include Vindi::API::Get

  end
end
