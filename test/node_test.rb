require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'

class NodeTest < Minitest::Test
  def setup
    @node = Node.new('boom')
  end

  def test_it_exists
    assert_instance_of Node, @node
  end

  def test_attributes
    assert_equal 'boom', @node.data
    assert_nil @node.next_node
  end

  def test_can_set_value_for_next_node
    new_node = Node.new('bap')
    @node.next_node = new_node
    assert_equal new_node, @node.next_node
  end

  def test_tail?
    assert @node.tail?

    new_node = Node.new('bap')
    @node.next_node = new_node

    refute @node.tail?
    assert @node.next_node.tail?
  end
end
