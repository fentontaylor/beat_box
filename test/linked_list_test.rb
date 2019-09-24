require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'
require './lib/linked_list'
require 'pry'

class LinkedListTest < Minitest::Test
  def setup
    @list = LinkedList.new
  end

  def test_it_exists
    assert_instance_of LinkedList, @list
  end

  def test_attributes
    assert_nil @list.head
  end

  def test_empty?
    assert @list.empty?

    @list.head = Node.new('boom')

    refute @list.empty?
  end

  def test_last_node
    node_1 = Node.new('first')
    node_2 = Node.new('tail')
    @list.head = node_1
    @list.head.next_node = node_2

    assert_equal node_2, @list.last_node(@list.head)
  end

  def test_append
    @list.append('doop')
    assert_instance_of Node, @list.head
    assert_equal 'doop', @list.head.data
    assert_nil @list.head.next_node

    @list.append('beep')
    assert_instance_of Node, @list.head.next_node
    assert_equal 'beep', @list.head.next_node.data
  end

  def test_count
    assert_equal 0, @list.count

    @list.append('beep')
    assert_equal 1, @list.count

    @list.append('boom')
    @list.append('bap')
    assert_equal 3, @list.count
  end

  def test_to_string
    assert_equal '', @list.to_string

    @list.append('beep')
    assert_equal 'beep', @list.to_string

    @list.append('boom')
    @list.append('bap')
    assert_equal 'beep boom bap', @list.to_string
  end
end
