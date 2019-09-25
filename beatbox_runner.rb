require './lib/node'
require './lib/linked_list'
require './lib/beat_box'

beats = "oontz, oontz, oontz, oontchik, oontz, oontz, oontz, oontchik, oontz, oontz, oontz, oontchik"

beatbox = BeatBox.new

beatbox.append(beats)

beatbox.play(speed: 300)
