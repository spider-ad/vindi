module Vindi
  module API
    module Create
      extend Vindi::API

      module ClassMethods
        def create(params = {})
          resp = Request.new(:post, normalize_resource_name, params).perform
          parse(resp)
        end
      end

      def self.included(receiver)
        receiver.extend ClassMethods
      end

    end
  end
end
