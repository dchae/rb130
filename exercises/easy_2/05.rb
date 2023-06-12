# def drop_while(arr)
#   i = 0; i += 1 while i < arr.size && yield(arr[i]); arr[i..]
# end

# def drop_while(arr)
#   arr.each_with_index { |x, i| return arr[i..] if !yield(x) }; []
# end

def drop_while(arr)
  arr[arr.reduce(0) { |i, x| yield(x) ? i + 1 : (break(i)) }..]
end

p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []
