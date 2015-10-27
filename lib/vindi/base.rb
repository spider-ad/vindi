require "hashie"

module Vindi
  class Base < ::Hashie::Mash


   protected

    # @return [String] returns the resource class name pluralized
    def self.normalize_resource_name
      resource_name.pluralize
    end

    # @return [String] returns the resource class name singular
    def self.resource_name
      self.name.demodulize.underscore
    end

    # @return [False] checks if the resoruce response key parser
    def self.reponse_has_key?
      false
    end

  end
end

