require "hashie"

module Vindi
  class Base < ::Hashie::Mash


   protected

    # @return [String] returns the rousce class name pluralized
    def self.normalize_resource_name
      self.name.demodulize.underscore.pluralize
    end

  end
end

