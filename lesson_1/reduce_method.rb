def reduce(iter, res = nil)
  i = 0
  if res == nil
    res = iter[i]
    i += 1
  end

  while i < iter.size
    res = yield(res, iter[i])
    i += 1
  end
  res
end

p arr = (0..15).to_a
p arr.sum
p arr.reduce(0) { |res, x| res + x }
p reduce(arr, 0) { |res, x| res + x }
p reduce(arr) { |res, x| res + x }
p arr

p (0..15).to_a.reduce([]) { |res, x| res << x * 2 }
p reduce((0..15).to_a, []) { |res, x| res << x * 2 }

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']