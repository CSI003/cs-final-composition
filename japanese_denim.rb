# NAME OF SONG: Japanese Denim by Daniel Caesar
# SHEET MUSIC: https://www.guitartabsexplorer.com/daniel-caesar-Tabs/japanese-denim-crd.php {/ drums:
# BMP USED: https://songbpm.com/japanese-denim?q=japanese%20denim

# the bpm provided was too fast so I adjusted it
use_synth :fm
use_bpm 118

strings = [56, 53, 56] # an array is a list of values
index = 0


#variables: stored value
bass = :drum_heavy_kick #:drum_bass_hard #:drum_heavy_kick #:drum_cowbell
snare = :drum_snare_soft #:drum_snare_hard
crash = :drum_cymbal_closed

#custom samples: imports a custom recording as a sample and stores it in sonicpi
daniel1 = "~/Desktop/Composition/Samples/i_dont_stand.wav"
daniel2 = "~/Desktop/Composition/Samples/i_dont_drink.wav"
daniel3 = "~/Desktop/Composition/Samples/met_you_at_shop.wav"
daniel4 = "~/Desktop/Composition/Samples/never_thought.wav"
ohh = "~/Desktop/Composition/Samples/ohh.wav"


#functions: define a bigger chunk of commands into a variable
# called in the live_loops after defining them
define :main do
  sample bass, sustain: 2, amp: rrand(9.5,10) #randomizes the force (amp) applied to hit the drum
  sleep 2.5
  sample crash, amp: rrand(9.5,10)
  sleep 2
  sample bass, amp: rrand(4.5,5)
  sleep 0.25
  sample bass, amp: rrand(4.5,5)
  sleep 2.5
end

define :drums do
  with_fx :distortion do
    main
    build = 2 # variable in a loop
    3.times do #plays the build variable 3 times before reseting to 2
      sample bass, amp: build
      sleep 1
      build = build + 4
    end
    
  end
end

define :guitar do
  with_fx :reverb do
    play 51, sustain: 0.5
    sleep 2.5
    play 58, sustain: 1
    sleep 2
    play 53, sustain: 1
    sleep 2.75
    3.times do
      index = rrand_i(0,2) #randomizes the array values
      play strings[index], sustain: 1
      print index #prints the index number in the log
      sleep 1
    end
  end
end

#parameterizes the values to play a specific variable/value when defined in the loops
define :vocals do |a, b, c, d|
  sample a
  sleep 8.63
  sample b
  sleep 17.26
  sample c
  sleep 8.63
  sample d
  sleep 17.26
end

define :ohhh do
  sample ohh, amp: 2, rate: 0.75
  sleep 8.878
end

#song

#=begin
main
sleep 2.5
#=end

live_loop :track_one do
  drums
end

live_loop :track_two do
  sync :track_one
  #guitar
end

live_loop :track_three do
  sync :track_one
  #vocals daniel1, daniel2, daniel3, daniel4
end

live_loop :track_four do
  sync :track_one
  #ohhh
end


=begin
live_loop :track_one do
  stop
end
live_loop :track_two do
  stop
end
live_loop :track_three do
  stop
end
live_loop :track_four do
  stop
end
=end
