#introduction
#cosmic - jordan schorr

beat = "~/Desktop/Composition/Samples/beat.wav"
x = 0


24.times do
  sample beat, amp: x
  sleep 1.465
  x = x + 0.25
  print x
end
