def extract(arr)
  yield(arr)
end

arr = [1, 2, 3, 4, 5]

p extract(arr) { |a, b, *c| raptors = c }
