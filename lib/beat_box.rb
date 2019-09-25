class BeatBox
  attr_reader :list
  attr_accessor :speed, :voice

  def initialize
    @list = LinkedList.new
    @speed = 240
    @voice = 'Alex'
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

  def play(speed: @speed, voice: @voice, beats: @list.to_string)
    `say -r #{speed} -v #{voice} #{beats}`
  end
end
