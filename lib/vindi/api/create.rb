module Vindi
  module API
    module Create
      extend Vindi::API

      module ClassMethods
        def create(params = {})
          resp = Request.new(:post, normalize_resource_name, params).perform
          return self.new(resp) unless reponse_has_key?
          self.new(resp[key_parser])
        end
      end

      def self.included(receiver)
        receiver.extend ClassMethods
      end

    end
  end
end
