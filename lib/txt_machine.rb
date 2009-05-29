class TxtMachine
  
  @@config = {
    :gateway  => nil,
    :logger   => nil
  }

  def self.[](key)
    @@config[key.to_sym]
  end
  
  def self.[]=(key, value)
    @@config[key.to_sym] = value
  end
  
  def self.configure(config)
    @@config.update(config)
  end
  
  def self.configure!(config)
    @@config = config
  end
  
  def self.start(config = {}, &block)
    new(config).start(&block)
  end
  
  def self.send_message(*args)
    start { |me| me.send_message(*args) }
  end
  
  def initialize(config = {})
    @config = @@config.merge(config)
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