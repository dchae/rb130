# def step(start_val, end_val, step_val)
#   i = start_val
#   while i <= end_val
#     yield(i)
#     i += step_val
#   end
#   (start_val..end_val)
# end

def step(start, stop, increment)
  (start..stop).step(increment) { |i| yield(i)}
end

def step(start, stop, increment)
  start.step(stop, increment) { |i| yield(i) }; (start..stop)
end

p step(1, 10, 3) { |value| puts "value = #{value}" }
