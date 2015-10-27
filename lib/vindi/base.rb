require "hashie"

module Vindi
  class Base < ::Hashie::Mash


   protected

    def self.parse(response)
      return self.new(response) unless reponse_has_key?
      self.new(response[key_parser])
    end

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

