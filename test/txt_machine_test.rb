require 'flexmock'
require 'flexmock/test_unit'

class TxtMachineTest < Test::Unit::TestCase
  
  def setup
    @tm = TxtMachine.new(:gateway => TxtMachine::Gateways::Discard)
  end
  
  def test_correct_gateway_is_created
    assert @tm.gateway.is_a?(TxtMachine::Gateways::Discard)
  end
  
  def test_build_message_handles_message
    message = TxtMachine::Message.new
    assert_equal message, @tm.build_message(message)
  end
  
  def test_build_message_handles_string_and_options
    
    m1 = @tm.build_message("foobar")
    assert m1.is_a?(TxtMachine::Message)
    assert_equal "foobar", m1.body
    
    m2 = @tm.build_message(:originator => "moose", :body => "bleem")
    assert m2.is_a?(TxtMachine::Message)
    assert_equal "moose", m2.originator
    assert_equal "bleem", m2.body
    
    m3 = @tm.build_message("foobar", :originator => "moose", :body => "bleem")
    assert m3.is_a?(TxtMachine::Message)
    assert_equal "moose", m3.originator
    assert_equal "foobar", m3.body
    
  end
  
  def test_start_should_yield_self
    TxtMachine.start do |tm|
      assert tm.is_a?(TxtMachine)
    end
  end
  
  def test_send_message_should_invoke_send_on_gateway
    msg = TxtMachine::Message.new
    TxtMachine.start do |tm|
      flexmock(tm.gateway).should_receive(:send).once.with(msg)
      tm.send_message(msg)
    end
  end
  
  
end