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

def valid_speed?(speed)
  speed > 0
end

def set_speed(beatbox)
  speed = 0
  until valid_speed?(speed)
    print 'How fast? Enter a number: '
    speed = gets.chomp.to_i.abs
    print "\nInvalid speed. Try again.\n" unless valid_speed?(speed)
  end
  beatbox.speed = speed
end

def voice_options
  [1,2,3,4]
end

def valid_voice?(voice)
  voice_options.include? voice
end

def select_voice
  print "Choose a BeatBoxer:\n" +
  "  Gals: (1) Samantha  (2) Victoria\n" +
  "  Guys: (3) Alex      (4) Fred\n" +
  "\nSelection: "
  gets.chomp.to_i
end

def set_voice(beatbox)
  voice = 0
  until valid_voice?(voice)
    voice = select_voice
    print 'Invalid selection. Try again.' unless valid_voice?(voice)
  end
  beatbox.voice = case voice
    when 1 then 'Samantha'
    when 2 then 'Victoria'
    when 3 then 'Alex'
    when 4 then 'Fred'
  end
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
