class TxtMachine
  
  @@deliveries = []
  
  def self.clear_deliveries!
    @@deliveries = []
  end
  
  def self.deliveries
    @@deliveries
  end
  
  module Adapters
    class TestAdapter < SkeletonAdapter
      
      def send(message)
        TxtMachine.deliveries << message
      end
      
    end
  end
end