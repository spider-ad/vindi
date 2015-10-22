require "httparty"
require "addressable/uri"

module Vindi
  class Request
    include HTTParty

    attr_reader :request_method, :path, :uri, :options

    OPTIONS_KEY = {
      get:  :query,
      post: :body,
      put:  :body
    }

    # @param [Symbol] http verb
    # @param [String] path to the vindi api
    # @param [Hash<Symbol,String>] list of the http params
    def initialize(request_method, path, options = {})
      set_basic_auth
      @options        = options
      @uri            = URI.new(path, options[:id], :json)
      @path           = uri.path
      @request_method = request_method
    end

    # @return [HTTParty::Response] http response from the performed action
    def perform
      self.class.public_send(request_method, uri.to_s, { OPTIONS_KEY[request_method] => options })
    end

    protected

      def set_basic_auth
        self.class.basic_auth(Vindi.api_key, '')
      end

  end
end
