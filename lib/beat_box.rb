class BeatBox
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(string)
    strings = string.split
    strings.each { |str| @list.append(str) }
  end

  def prepend(string)
    strings = string.split.reverse
    strings.each { |str| @list.prepend(str) }
  end

  def count
    @list.count
  end

  def erase
    @list.head = nil
  end

  def play(speed: 150, voice: 'Alex', beats: @list.to_string)
    `say -r #{speed} -v #{voice} #{beats}`
  end
end
