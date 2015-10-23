module Vindi
  class Customer < Base

    def self.all(params = {})
      resp = Request.new(:get, normalize_resource_name, params).perform
      resp[normalize_resource_name].map do |element|
        self.new(element)
      end
    end

    def self.create(params = {})
      resp = Request.new(:post, normalize_resource_name, params).perform
      self.new(resp)
    end

    def self.delete(params = {})
      resp = Request.new(:delete, normalize_resource_name, params).perform
      self.new(resp)
    end

    def self.update(params = {})
      resp = Request.new(:put, normalize_resource_name, params).perform
      self.new(resp)
    end

    def self.find(params = {})
      resp = Request.new(:get, normalize_resource_name, params).perform
      self.new(resp)
    end

  end
end
