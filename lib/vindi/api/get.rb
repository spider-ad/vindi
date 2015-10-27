module Vindi
  module API
    module Get

      module ClassMethods
        def get(params = {})
          resp = Request.new(:get, normalize_resource_name, params).perform
          parse(resp)
        end

        alias :find :get
      end

      def self.included(receiver)
        receiver.extend ClassMethods
      end

    end
  end
end
