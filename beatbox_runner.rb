require './lib/node'
require './lib/linked_list'
require './lib/beat_box'
require 'pry'

def menu
  print "\nBeatBox Menu:\n" +
  "   Beat Options: [n - new beat] [a - append beats] [p - prepend beats]\n" +
  "   Play Options: [bb - play beat] [s - set speed] [v - set voice]\n" +
  "   [q - quit]\n" +
  "\nSelection: "
  gets.chomp.downcase
end

def new_beat(beatbox)
  print 'Write your beat box: '
  beats = gets.chomp
  beatbox.erase
  beatbox.append(beats)
end

def add_beats
  print 'Add these beats: '
  gets.chomp
end

def append_beats(beatbox)
  beats = add_beats
  beatbox.append(beats)
end

def prepend_beats(beatbox)
  beats = add_beats
  beatbox.prepend(beats)
end

def set_speed(beatbox)
  speed = 0
  until speed > 0
    print 'How fast? Enter a number: '
    speed = gets.chomp.to_i.abs
    print "\nInvalid speed. Try again.\n" unless speed > 0
  end
  beatbox.speed = speed
end

def play(beatbox)
  if beatbox.list.head
    beatbox.play
  else
    print "Need beats first!\n"
    new_beat(beatbox)
  end
end

beatbox = BeatBox.new

loop do
  select = menu

  case select
  when 'n' then new_beat(beatbox)
  when 'a' then append_beats(beatbox)
  when 'p' then prepend_beats(beatbox)
  when 's' then set_speed(beatbox)
  when 'v' then set_voice(beatbox)
  when 'bb' then play(beatbox)
  when 'q' then print "\nSee ya later!"; break
  else print  "\nInvalid selection. Try again.\n"
  end
end
