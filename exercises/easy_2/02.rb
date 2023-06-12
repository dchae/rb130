def zip(arr1, arr2)
  arr1.each_index.with_object([]) { |i, res| res << [arr1[i], arr2[i]] }
end

def zip(arr1, arr2)
  (arr1).map.with_index { |x, i| [x, arr2[i]] }
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
