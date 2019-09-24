class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def empty?
    @head.nil?
  end

  def last_node(node)
    return node if node.tail?
    last_node(node.next_node)
  end

  def append(data)
    empty? ? set_head(data) : set_tail(data)
  end

  private

  def new_node(data)
    Node.new(data)
  end

  def set_head(data)
    @head = new_node(data)
  end

  def set_tail(data)
    last_node(@head).next_node = new_node(data)
  end
end
