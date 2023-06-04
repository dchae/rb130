def times(n)
  i = 0
  while i < n
    yield i
    i += 1
  end
  n
end

p 5.times { |num| puts num }
puts
p times(5) { |num| puts num }
