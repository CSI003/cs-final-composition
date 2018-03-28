# NAME OF SONG: All Right Now by Free
# SHEET MUSIC: https://www.songsterr.com/a/wsa/free-all-right-now-tab-s7743t3 / https://guitaralliance.com/instant-song-library-download/Instant%20Song%20Library%20PDF/A-F/F/free-all_right_now2.pdf
# BMP USED: 120

#the synth masks the original sound with a modifier
use_synth :blade #:pluck #tb303
use_bpm 120
#beats per minute

#variables: stored value
bass = :drum_heavy_kick #:drum_bass_hard #:drum_heavy_kick #:drum_cowbell
snare = :drum_snare_soft #:drum_snare_hard
hihat = :drum_cymbal_closed
crash = :drum_cymbal_hard

#cutsom: imports a custom recording as a sample and stores it in sonicpi
there = "~/Desktop/Composition/Samples/there_she_stood.wav"
took = "~/Desktop/Composition/Samples/i_took_her_home.wav"
oh_yeah = "~/Desktop/Composition/Samples/oh_yeah.wav"
uh = "~/Desktop/Composition/Samples/uh.wav"
howard_solo = "~/Desktop/Composition/Samples/howard_solo.wav"

#array: an array is a list of values
paul = [there, took]
index = 0

#functions: define a bigger chunk of commands into a variable
# called in the live_loops after defining them
define :hi_hat do
  sample hihat, amp: rrand(1,1.5) #randomising how hard the hihat is hit (no human hits the drum with the same force each time)
  sleep 0.5
end

define :basic do
  sample bass, amp: rrand(1.5,2)
  sleep 1
  sample snare, amp: rrand(1.5,2)
  sleep 1
  sample bass, amp: rrand(1.5,2)
  sleep 0.5
  sample bass, amp: rrand(1.5,2)
  sleep 0.5
  sample snare, amp: rrand(1.5,2)
  sleep 1
  # four seconds
end

define :open do |a, b|
  sample a
  sleep 6
  sample b
  sleep 4
end


define :main do
  sample bass, amp: rrand(1.5,2)
  sample crash, sustain: 1.5
  sleep 1
  sample snare, amp: rrand(1.5,2)
  sleep 1
  sample bass, amp: rrand(1.5,2)
  sleep 0.5
  sample bass, amp: rrand(1.5,2)
  sleep 0.5
  sample snare, amp: rrand(1.5,2)
  sleep 1
  # four seconds
  3.times do
    basic
  end
end

define :vocals do
  i = 0
  2.times do
    sleep 16
    sample paul[i], amp: 1 # calls the array after each time alotted (arrays are defined at the top from an imported custom sample)
    sleep 4
    i += 1
  end
end

define :build do
  # x represents the amplitude that is changing after each loop runs
  x = 1
  sample bass, amp: x, sustain: 0.5
  sleep 0.25
  2.times do
    sample snare, amp: rrand(1.5,2)
    sleep 0.25
  end
  x = x + 0.5
  sample bass, amp: x
  sample snare, amp: rrand(1.5,2)
  sleep 0.25
  3.times do
    sample snare, amp: rrand(1.5,2)
    sleep 0.25
  end
  x = x + 0.5
  sample bass, amp: x
  sample snare, amp: rrand(1.5,2)
  sleep 0.25
  3.times do
    sample snare, amp: rrand(1.5,2)
    sleep 0.25
  end
  x = x + 0.5
  sample bass, amp: x
  sample snare, amp: rrand(1.5,2)
  sleep 0.25
  3.times do
    sample snare, amp: rrand(1.5,2)
    sleep 0.25
  end
  
end

define :howard do
  sample howard_solo, amp: 2
  sleep 15.23
end

# because there is nothing repeating in the set of notes, there is no way for me to condense it
define :notes do
  play :e3
  play :a2
  play :e2
  sleep 2
  
  play :f3
  play :a1
  sleep 0.5
  
  play :d3
  play :a3
  play :f2
  sleep 1.5
  
  play :c4
  play :e3
  play :a2
  play :e2
  sleep 3.5
  
  play :a1
  sleep 0.5
  
  play :e3
  play :d1
  play :g5
  play :f1
  sleep 1
  
  play :e3
  play :d1
  play :g5
  play :f1
  sleep 1
  
  play :d3
  play :a2
  play :f3
  sleep 0.5
  
  play :d3
  play :a2
  play :f3
  sleep 0.5
  
  play :d3
  play :a2
  play :f3
  sleep 0.5
  
  play :a1
  sleep 0.5
  
  play :c4
  play :e3
  play :a2
  play :e2
  sleep 3.5
end

#song

#=begin
open oh_yeah, uh
build
#=end

#loops the track the entire time unless told otherwise
live_loop :track1 do
  main
end

live_loop :track2 do
  sync :track1 #syncs the start of the loop to track one
  #notes
end

live_loop :track3 do
  sync :track1
  #vocals
end

live_loop :track4 do
  sync :track1
  #howard
end

=begin
live_loop :track1 do
  stop
end
live_loop :track2 do
  stop
end
live_loop :track3 do
  stop
end
=end
