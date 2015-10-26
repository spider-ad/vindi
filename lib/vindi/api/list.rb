module Vindi
  module API
    module List

      module ClassMethods
        def list(params = {})
          resp = Request.new(:get, normalize_resource_name, params).perform
          resp[normalize_resource_name].map do |element|
            self.new(element)
          end
        end

        alias :all :list
      end

      def self.included(receiver)
        receiver.extend ClassMethods
      end

    end
  end
end
