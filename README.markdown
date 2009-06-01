TxtMachine
==========

(c) 2009 Jason Frame [jason@onehackoranother.com]

Like ActionMailer, but for (outgoing) SMS, featuring pluggable adapters for
different SMS gateways. Currently only supports [iTAGG](http://www.itagg.com/)
but writing a new adapter for your new provider should be quick and easy.

Warning - it's a little rough round the edges.

Quick Example
-------------

    TxtMachine.configure(
      :gateway => TxtMachine::Gateways::Itagg,
      :username => "username",
      :password => "password",
      :originator => "Captain Haddock"
    )
    
    # Send a single message
    TxtMachine.send_message("Message body", :to => "07123456789")
    
    # Send a single message, alternative syntax
    TxtMachine.send_message(:to => "07123456789", :body => "Message body")
    
    # Send message to multiple recipients
    TxtMachine.send_message("Foobar", :to => [number1, number2, number3])
    
    # Open a session if your adapter uses stateful connections
    TxtMachine.start do |tm|
      tm.send_message("Foobar", :to => some_number)
      tm.send_message("Bazbar", :to => some_other_number)
      tm.send_message("Bleem", :to => bob)
    end
    
Writing an adapter
------------------

Check out `TxtMachine::Gateways::Skeleton`, it's probably easiest to extend this. Most
SMS gateways I've seen use HTTP so all you need to do is implement the `send` method
in your adapter to send in-place.

Using with Rails
----------------

Perform any global configuration using `config.after_initialize` within
`Rails::Initializer.run`:

    Rails::Initializer.run do |config|
    
      # ...
      
      config.gem "jaz303-txt_machine", :lib => "txt_machine"
      
      # ...
      
      config.after_initialize do
        TxtMachine[:originator] = "Bob's Sprockets Co"
      end
      
    end
    
And then any per-env config in the appropriate file, again using `config.after_initialize`.

    # in production.rb...
    
    config.after_initialize do
      TxtMachine[:gateway] = My::Funky::Gateway
      TxtMachine[:api_key] = 'g1bb3r1sh'
    end
    
Please use an `after_initialize` block otherwise things will get screwy with gems being
inexplicably loaded twice.

Test Integration
----------------

Like ActionMailer, TxtMachine has a test mode which pushes all delivered messages onto
an array:

    # Equivalent to:
    # TxtMachine[:gateway] = TxtMachine::Gateways::Test
    # TxtMachine.clear_deliveries!
    TxtMachine.test_mode!
    
    TxtMachine.send_message("my message", :to => [r1, r2])
    
    assert_equal 1, TxtMachine.deliveries.length
    => true
    
TxtMachine will detect Rails' test environment and set itself up accordingly.
    
Contributing
------------

Please do :) Fork away...