# def each_with_index(arr)
#   i = 0; (yield(arr[i], i); i += 1) while i < arr.size; arr
# end

def each_with_index(arr)
  arr.reduce(0) { |i, x| yield(x, i); i += 1 }; arr
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]