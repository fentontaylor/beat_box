class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def empty?
    @head.nil?
  end
end
