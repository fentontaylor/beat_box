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

  def prepend(data)
    list = @head
    set_head(data)
    @head.next_node = list
  end

  def insert(position, data)
    node = new_node(data)
    previous_node = node_at(@head, position - 1)
    next_node = node_at(@head, position)
    previous_node.next_node = node
    node.next_node = next_node
  end

  def find(start, num)
    to_string.split[start..start + num - 1].join(' ')
  end

  def pop
    return '' if empty?
    beat = last_node(@head).data
    node_at(@head, count - 2).next_node = nil
    beat
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

  def combine(node, string)
    string.concat(' ', node.data)
  end

  def make_string(node, string)
    return combine(node, string) if node.tail?
    make_string(node.next_node, combine(node, string))
  end

  def node_at(node, position, counter = 0)
    return node if position == counter
    node_at(node.next_node, position, counter += 1)
  end
end
