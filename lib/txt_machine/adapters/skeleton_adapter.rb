class TxtMachine
  module Adapters
    class SkeletonAdapter
    
      def initialize(config = {})
        @config = default_config.merge(config)
      end
      
      def connect
        begin
          establish_connection
          yield
          process_deliveries
        ensure
          teardown_connection
        end
      end
      
      # If your adapter is stateless you can get away with just sending your
      # message from this method rather than implementing the whole set.
      def send(message)
      end
      
    private
    
      def establish_connection
      end
      
      def process_deliveries
      end
      
      def teardown_connection
      end
      
      def default_config
        {}
      end
      
    end
  end
end