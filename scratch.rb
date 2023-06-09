def foo
  yield(rand(100))
end

bar = :to_s.to_proc

p foo(&bar)