# def bubble_sort!(arr)
#   unsorted = arr.size - 1
#   while unsorted > 0
#     last_sorted = 0
#     unsorted.times do |i|
#       a, b = arr[i], arr[i + 1]
#       unless (block_given? ? yield(a, b) : a < b)
#         arr[i], arr[i + 1] = b, a
#         last_sorted = i
#       end
#     end
#     unsorted = last_sorted
#   end
#   arr
# end

# def bubble_sort!(a)
#   (n = a.size - 1).times { |i| (n - i).times { |j| a[j], a[j + 1] = a[j + 1], a[j] if (block_given? ? !yield(*a[j, 2]) : a[j] > a[j + 1]) } }
# end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
p array == [7, 5, 3]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
p array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
p array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)