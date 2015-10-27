module Vindi
  class Product < Base
    include Vindi::API::Create
    include Vindi::API::List
    include Vindi::API::Update
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
