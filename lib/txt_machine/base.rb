module TxtMachine
  class Base

    def initialize(config = {})
      @config = config
    end

    def start
      gateway.connect { yield self }
    end

    def send_message(*args)
      gateway.send(build_message(*args))
    end

    def gateway
      @gateway ||= gateway_class.new(@config)
    end

    def build_message(*params)
      if params.first.is_a?(Message)
        params.first
      else
        Message.new(*params)
      end
    end

  private

    def gateway_class
      case @config[:gateway]
      when Class
        @config[:gateway]
      else
        raise ArgumentError
      end
    end

  end
end