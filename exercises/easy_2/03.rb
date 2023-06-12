def map(collection)
  collection.each_with_object([]) { |e, res| res << yield(e) }
end

def map(collection)
  block_given? ? collection.each_with_object([]) { |e, res| res << yield(e) } : collection.to_enum
end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(%w[a b c d]) { |value| false } == [false, false, false, false]
p map(%w[a b c d]) { |value| value.upcase } == %w[A B C D]
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]
p map({a: 1, b: 2, c: 3}) { |k, v| [v, k] } == [[1, :a], [2, :b], [3, :c]]
require "set"
p map(Set.new(1..3)) { |x| x * 5 } == [5, 10, 15]
p map([1, 2, 3]).is_a? Enumerator