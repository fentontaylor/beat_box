require './lib/node'
require './lib/linked_list'
require './lib/beat_box'

beats = "ding dah oom oom ding oom oom oom ding dah oom oom ding dah oom oom ding dah oom oom"
beats_2 = "boom boom dee dap boom dee dee dap boom dee boom dap"

beatbox = BeatBox.new

beatbox.append(beats_2)

beatbox.play(speed: 200)
