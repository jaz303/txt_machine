module TxtMachine
  class Message
    attr_accessor :originator
    attr_accessor :body
    attr_reader   :to
  
    def initialize(*args)
    
      options = args.last.is_a?(Hash) ? args.pop : {}
    
      @originator = options[:originator]
      @body       = options[:body] || ''
      @to         = [options[:to]].flatten.compact
    
      unless args.empty?
        @body = args.first.to_s
      end
    
    end
  
    def <<(recipient)
      @to << recipient
      self
    end
  
    def recipients
      [to].flatten
    end
  end
end