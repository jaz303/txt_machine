module TxtMachine
  
  @@deliveries = []
  
  def self.test_mode!
    self[:gateway] = Gateways::Test
    clear_deliveries!
  end
  
  def self.clear_deliveries!
    @@deliveries = []
  end
  
  def self.deliveries
    @@deliveries
  end
  
  module Gateways
    class Test < Skeleton
      
      def send(message)
        TxtMachine.deliveries << message
      end
      
    end
  end
end
