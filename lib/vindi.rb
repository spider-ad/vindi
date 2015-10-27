require "vindi/version"
require "vindi/uri"
require 'vindi/request'
require 'vindi/api/list'
require 'vindi/api/create'
require 'vindi/api/delete'
require 'vindi/api/update'
require 'vindi/api/get'
require 'vindi/base'
require 'vindi/customer'
require 'vindi/payment_profile'
require 'active_support/inflector'


module Vindi

  module Configuration
    attr_accessor :api_key

    def configure
      yield self
    end
  end

  extend Configuration
end
