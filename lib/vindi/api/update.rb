module Vindi
  module API
    module Update

      module ClassMethods
        def update(params = {})
          resp = Request.new(:put, normalize_resource_name, params).perform
          parse(resp)
        end

      end

      def self.included(receiver)
        receiver.extend ClassMethods
      end

    end
  end
end
