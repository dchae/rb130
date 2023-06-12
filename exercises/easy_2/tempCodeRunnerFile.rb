def max_by(arr)
#   (arr[1..] || (return nil)).reduce([yield(arr[0]), arr[0]]) { |m, x| (cur = yield(x)) > m[0] ? [cur, x] : m }.last
# end