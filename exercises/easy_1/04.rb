def divisors(n)
  (1..n**(0.5)).each_with_object([]) { |x, res| n % x == 0 && res << x && n / x != x && res << n / x }#.sort
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99_400_891) == [1, 9967, 9973, 99_400_891] # may take a minute
