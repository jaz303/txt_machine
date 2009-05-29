class TxtMachine
  
  @@config = {
    :adapter  => :none,
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
    adapter.connect { yield self }
  end
  
  def send_message(*args)
    adapter.send(build_message(*args))
  end
  
  def adapter
    @adapter ||= adapter_class.new(@config)
  end
  
  def build_message(*params)
    if params.first.is_a?(Message)
      params.first
    else
      Message.new(*params)
    end
  end
  
private

  def adapter_class
    case @config[:adapter]
    when Class
      @config[:adapter]
    else
      raise ArgumentError
    end
  end

end