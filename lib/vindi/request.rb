require "httparty"
require "addressable/uri"

module Vindi
  class Request
    include HTTParty

    base_uri 'https://app.vindi.com.br/api/v1/'
    format :json

    attr_reader :request_method, :path, :uri, :options

    # @param [Symbol] http verb
    # @param [String] path to the vindi api
    # @param [Hash<Symbol,String>] list of the http params
    def initialize(request_method, path, options = {})
      set_basic_auth
      @uri = ::Addressable::URI.parse(self.class.base_uri + path)
      @path = uri.path
      @options = default_format(options)
      @request_method = request_method
    end

    # @return [HTTParty::Response] http response from the performed action
    def perform
      options_key = request_method == :get ? :query : :form
      self.class.public_send(request_method, uri.to_s,
        { options_key => options })
    end

    protected

      def set_basic_auth
        self.class.basic_auth(Vindi.api_key, '')
      end

      # Defines the defaul format as json if is not defiend on the params
      # @param see #initialize
      def default_format(options)
        { format: "json" }.merge(options)
      end

  end
end
