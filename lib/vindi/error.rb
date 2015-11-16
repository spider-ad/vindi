module Vindi
  # Responsable to wrap any error from API
  class Error < StandardError

    attr_reader :id, :parameter, :message

    # @param [String] id shows the type of error
    # @param [String] parameter shows the paremeter failing
    # @param [String] message  explans the error
    def initialize(id, parameter, message)
      @id, @parameter, @message = id, parameter, message
    end

    def to_s
      "[#{id}] #{parameter}: #{message}"
    end

  end

end
