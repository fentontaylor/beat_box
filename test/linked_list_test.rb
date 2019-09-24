require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'
require './lib/linked_list'

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
end
