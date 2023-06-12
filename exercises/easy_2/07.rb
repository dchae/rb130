def each_with_object(arr, memo)
  arr.each { |x| yield(x, memo) };memo
end

result = each_with_object([1, 3, 5], []) { |value, list| list << value**2 }
p result == [1, 9, 25]
result =
  each_with_object([1, 3, 5], []) { |value, list| list << (1..value).to_a }
p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]
result =
  each_with_object([1, 3, 5], {}) { |value, hash| hash[value] = value**2 }
p result == { 1 => 1, 3 => 9, 5 => 25 }
result = each_with_object([], {}) { |value, hash| hash[value] = value * 2 }
p result == {}
