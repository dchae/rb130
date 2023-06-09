def foo
  yield(1, 2, 3)
end

foo { |a, b, c, d| p a, b, c, d }