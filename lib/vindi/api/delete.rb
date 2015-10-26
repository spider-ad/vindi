module Vindi
  module API
    module Delete

      module ClassMethods
        def delete(params = {})
          resp = Request.new(:delete, normalize_resource_name, params).perform
          self.new(resp)
        end
      end

      def self.included(receiver)
        receiver.extend ClassMethods
      end

    end
  end
end
