require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'
require './lib/linked_list'
require './lib/beat_box'
require 'pry'

class BeatBoxTest < Minitest::Test
  def setup
    @beatbox = BeatBox.new
  end

  def test_it_exists
    assert_instance_of BeatBox, @beatbox
  end

  def test_attributes
    assert_instance_of LinkedList, @beatbox.list
    assert_nil @beatbox.list.head
  end

  def test_append
    @beatbox.append('shoop dee doo')

    assert_equal 'shoop', @beatbox.list.head.data
    assert_equal 'dee', @beatbox.list.head.next_node.data
  end

  def test_count
    assert_equal 0, @beatbox.count

    @beatbox.append("deep doo ditt")
    assert_equal 3, @beatbox.count
    
    @beatbox.append("boom dee pow")
    assert_equal 6, @beatbox.count
  end
end
