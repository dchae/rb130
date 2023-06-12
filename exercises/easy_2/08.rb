# def max_by(arr)
#   max, res = nil, arr.first
#   arr.each do |x|
#     cur = yield(x)
#     max = cur if max == nil
#     max, res = cur, x if cur > max
#   end
#   res
# end

# don't like yielding elements multiple times - this solution will fail for certain test cases
# def max_by(arr)
#   arr.reduce(arr[0]) { |memo, x| yield(x) > yield(memo) ? x : memo }
# end

# def max_by(arr)
#   (arr[1..] || (return nil)).each_with_object([yield(arr[0]), arr[0]]) { |x, m| (cur = yield(x)) > m[0] && (m[0], m[1] = cur, x) }.last
# end

def max_by(arr)
  (arr[1..] || (return nil)).reduce([yield(arr[0]), arr[0]]) { |m, x| (cur = yield(x)) > m[0] ? [cur, x] : m }.last
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([1, 2]) { |value| value * 10 } == 2
p max_by([1]) { |value| value * 10 } == 1
p max_by([]) { |value| value + 5 } == nil
