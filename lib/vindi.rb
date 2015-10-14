require "vindi/version"
require 'vindi/request'

module Vindi
  module Configuration
    attr_accessor :api_key

    def configure
      yield self
    end
  end

  extend Configuration
end
