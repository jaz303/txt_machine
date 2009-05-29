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

Test Integration
----------------

Like ActionMailer, TxtMachine has a test mode which pushes all delivered messages onto
an array:

    TxtMachine[:gateway] = TxtMachine::Gateways::Test
    TxtMachine.send_message("my message", :to => [r1, r2])
    
    assert_equal 1, TxtMachine.deliveries.length
    => true
    
Contributing
------------

Please do :) Fork away...