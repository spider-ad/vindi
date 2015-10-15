require "hashie"

module Vindi
  class Customer < ::Hashie::Mash

    def self.all(params = {})
      resp = Request.new(:get, 'customers', params).perform
      resp['customers'].map do |element|
        self.new(element)
      end
    end

  end
end
