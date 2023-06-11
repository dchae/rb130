# def one?(arr)
#   cnt = 0
#   arr.each { |e| break if yield(e) && (cnt += 1) > 1 }
#   cnt == 1
# end

# def one?(arr)
#   arr.reduce(0) { |cnt, e| cnt > 1 ? break : yield(e) ? cnt + 1 : cnt } == 1
# end

# def one?(arr)
#   arr.reduce(0) { |cnt, e| yield(e) ? (cnt > 1 ? break : cnt + 1) : cnt } == 1
# end

def one?(arr)
  arr.reduce(false) { |seen, e| yield(e) ? (seen ? (return false) : true ): seen }
end

p one?([1, 3, 5, 6]) { |value| value.even? } # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? } # -> false
p one?([2, 4, 6, 8]) { |value| value.even? } # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one?([1, 3, 5, 7]) { |value| true } # -> false
p one?([1, 3, 5, 7]) { |value| false } # -> false
p one?([]) { |value| true } # -> false
