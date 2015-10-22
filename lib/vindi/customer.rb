require "hashie"

module Vindi
  class Customer < ::Hashie::Mash

    def self.all(params = {})
      resp = Request.new(:get, 'customers', params).perform
      resp['customers'].map do |element|
        self.new(element)
      end
    end

    def self.create(params = {})
      resp = Request.new(:post, 'customers', params).perform
      self.new(resp)
    end

    def self.delete(params = {})
      resp = Request.new(:delete, "customers/#{params[:id]}", params).perform
      self.new(resp)
    end

    def self.update(params = {})
      resp = Request.new(:put, "customers/#{params[:id]}", params).perform
      self.new(resp)
    end
  end
end
