# def each_cons(arr)
#   width = 2
#   i = 0
#   while i <= arr.size - width
#     yield(*arr[i, width])
#     i += 1
#   end
# end

def each_cons(arr)
  i = 0; (yield(arr[i, 2]); i += 1) while i < arr.size - 1
end

# def each_cons(arr)
#   arr.each_with_index { |x, i| i > arr.size - 2 ? break : yield(x, arr[i + 1])} && nil
# end

hash = {}
result = each_cons([1, 3, 6, 10]) { |value1, value2| hash[value1] = value2 }
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) { |value1, value2| hash[value1] = value2 }
p hash == {}
p result == nil

hash = {}
result = each_cons(%w[a b]) { |value1, value2| hash[value1] = value2 }
p hash == { "a" => "b" }
p result == nil
