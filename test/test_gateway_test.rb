class TestGatewayTest < Test::Unit::TestCase
  
  def setup
    TxtMachine[:gateway] = TxtMachine::Gateways::Test
    TxtMachine.clear_deliveries!
    @gateway = TxtMachine.new.gateway
  end
  
  def test_sent_messages_are_added_to_deliveries
    m1 = TxtMachine::Message.new
    m2 = TxtMachine::Message.new
    @gateway.send(m1)
    @gateway.send(m2)
    assert_equal 2, TxtMachine.deliveries.length
    assert_equal m1, TxtMachine.deliveries[0]
    assert_equal m2, TxtMachine.deliveries[1]
  end
  
  def test_clear_deliveries_is_sane
    TxtMachine.deliveries << 1
    TxtMachine.deliveries << 2
    TxtMachine.clear_deliveries!
    assert TxtMachine.deliveries.empty?
  end
  
end