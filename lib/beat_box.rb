class BeatBox
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(string)
    strings = string.split
    strings.each { |str| @list.append(str) }
  end

  def count
    @list.count
  end

  def play(speed: 150, voice: 'Alex')
    `say -r #{speed} -v #{voice} #{@list.to_string}`
  end
end
