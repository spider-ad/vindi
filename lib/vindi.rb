require "vindi/version"
require "vindi/uri"
require 'vindi/request'
require 'vindi/customer'

module Vindi
  module Configuration
    attr_accessor :api_key

    def configure
      yield self
    end
  end

  extend Configuration
end
