def select(iter)
  i, res = 0, []
  while i < iter.size
    res << iter[i] if yield(iter[i])
    i += 1
  end
  res
end

p select((0..15).to_a) { |x| x.odd? && x < 12 }
