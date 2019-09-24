require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'
require './lib/linked_list'
require './lib/beat_box'

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
end
