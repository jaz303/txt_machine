module TxtMachine
  class SendFailedError < RuntimeError
    attr_reader :wrapped_exception
    
    def initialize(options = {})
      super(options[:message])
      @wrapped_exception = options[:wrapped_exception]
    end
  end
end