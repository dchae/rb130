def sequence
  count = 0
  Proc.new { count += 1 }
end

seq_1 = sequence
seq_2 = sequence

p seq_1.call
p seq_1.call
p seq_1.call
puts
p seq_2.call
p seq_1.call
p seq_2.call