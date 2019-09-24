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

  def count
    return 0 if empty?
    count_nodes(@head, 1)
  end

  def to_string
    return '' if empty?
    make_string(@head, '').lstrip
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

  def count_nodes(node, counter)
    return counter if node.tail?
    count_nodes(node.next_node, counter += 1)
  end

  def make_string(node, string)
    # binding.pry
    return string.concat(' ', node.data) if node.tail?
    make_string(node.next_node, string.concat(' ', node.data))
  end
end
