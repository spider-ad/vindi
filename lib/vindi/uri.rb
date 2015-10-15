module Vindi
  class URI

    BASE = 'https://app.vindi.com.br/api/v1/'

    attr_reader :uri

    # @param path [String] uri resource
    # @param format [String, Symbol] the format (json or xml)
    def initialize(resource, format)
      resource = set_format(resource, format)
      @uri = parse(BASE).join(resource)
    end

    [:to_s, :path].each do |method|
      define_method method do
        uri.public_send(method)
      end
    end

    protected

      def set_format(resource, format)
         resource += ".#{format}"
      end

      def parse(path)
        ::Addressable::URI.parse(path)
      end

  end
end
