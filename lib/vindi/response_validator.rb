module Vindi

  class ResponseValidator

    attr_reader :status_code, :http_response

    def initialize(status_code, http_response)
      @status_code   = status_code
      @http_response = http_response
    end

    def validate!
      raise Error.new(errors["id"], errors["parameter"], errors["message"]) if invalid?
      http_response
    end

    protected

    def errors
      http_response["errors"].first
    end

    def invalid?
      status_code != 200 && status_code != 201
    end

  end

end

