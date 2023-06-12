# def each_cons(arr, width)
#   i = 0
#   while i <= arr.size - width
#     yield(*arr[i, width])
#     i += 1
#   end
# end

# def each_cons(arr, k)
#   i = 0; (yield(*arr[i, k]); i += 1) while i <= arr.size - k
# end

def each_cons(arr, k)
  arr.each_with_index { |_, i| i > arr.size - k ? break : yield(*arr[i, k]) } && nil
end

hash = {}
each_cons([1, 3, 6, 10], 1) { |value| hash[value] = true }
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) { |value1, value2| hash[value1] = value2 }
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) { |value1, *values| hash[value1] = values }
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) { |value1, *values| hash[value1] = values }
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) { |value1, *values| hash[value1] = values }
p hash == {}
