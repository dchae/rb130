# def time_it
#   start = Time.now
#   yield
#   finish = Time.new
#   finish - start
# end

# def check_perfect_number(n)
#   sum = 0
#   i = 1
#   lim = (n**0.5).to_i
#   sum -= lim if lim == n**0.5
#   while i <= lim
#     sum += i + n / i if n % i == 0
#     i += 1
#   end
#   sum - n == n
# end

# p time_it { 1_000.times { check_perfect_number(rand(10_000_000)) } }

def time_it(&block)
  start = Time.now
  block.call
  finish = Time.new
  finish - start
end

def check_perfect_number(n)
  sum = 0
  i = 1
  lim = (n**0.5).to_i
  sum -= lim if lim == n**0.5
  while i <= lim
    sum += i + n / i if n % i == 0
    i += 1
  end
  sum - n == n
end

p time_it { 1_000.times { check_perfect_number(rand(10_000_000)) } }

