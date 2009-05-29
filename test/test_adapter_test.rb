class TestAdapterTest < Test::Unit::TestCase
  
  def setup
    TxtMachine[:adapter] = TxtMachine::Adapters::TestAdapter
    TxtMachine.clear_deliveries!
    @adapter = TxtMachine.new.adapter
  end
  
  def test_sent_messages_are_added_to_deliveries
    m1 = TxtMachine::Message.new
    m2 = TxtMachine::Message.new
    @adapter.send(m1)
    @adapter.send(m2)
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