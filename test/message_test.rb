class MessageTest < Test::Unit::TestCase
  
  def setup
    @class = TxtMachine::Message
  end
  
  def test_message_initializes_with_body
    m = @class.new("foobar")
    assert_equal "foobar", m.body
  end
  
  def test_message_initializes_with_options
    m = @class.new(:originator => 'a', :body => 'b', :to => %w(a b))
    assert_equal 'a', m.originator
    assert_equal 'b', m.body
    assert_equal %w(a b), m.to
  end
  
  def test_message_initializes_with_body_and_options
    m = @class.new('body', :originator => 'a', :body => 'b', :to => %w(c d))
    assert_equal 'a', m.originator
    assert_equal 'body', m.body
    assert_equal %w(c d), m.to
  end
  
  def test_new_message_has_no_recipients
    assert @class.new.recipients.empty?
  end
  
  def test_append_returns_self
    m = @class.new
    assert_equal m, m << "foo"
  end
  
  def test_recipients_is_flattened
    m = @class.new
    m << ["foo", "bar"]
    m << "baz"
    m << ["bleem"]
    assert_equal %w(foo bar baz bleem), m.recipients
  end
  
end