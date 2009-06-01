%w(
  base
  message
  gateways/skeleton
  gateways/discard
  gateways/test
  gateways/itagg
).each do |file|
  require File.dirname(__FILE__) + '/txt_machine/' + file
end

module TxtMachine
  
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
  
  def self.new(config = {})
    Base.new(@@config.merge(config))
  end
  
  def self.start(config = {}, &block)
    new(config).start(&block)
  end
  
  def self.send_message(*args)
    start { |me| me.send_message(*args) }
  end

end