def each(iter)
  i = 0
  while i < iter.size
    yield(iter[i])
    i += 1
  end
  iter
end