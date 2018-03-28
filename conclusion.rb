#conclusion
#cosmic - jordan schorr

beat = "~/Desktop/Composition/Samples/beat.wav"
x = 6

live_loop :cosmic do
  24.times do
    sample beat, amp: x
    sleep 1.5
  end
  x = x - 0.25
  print x
end
