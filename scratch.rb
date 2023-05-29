def compare(s)
  puts "Before: #{s}"
  after = yield s if block_given?
  puts "After: #{after}"
end


compare('hi') { |word| word.upcase }

# Output:
# Before: hi
# After: HI

compare('hello') { |word| word.slice(1..2) }

# Before: hello
# After: el
# => nil

compare('hello') { |word| "nothing to do with anything" }

# Before: hello
# After: nothing to do with anything
# => nil

compare('hello') { |word| puts "hi" }

# Before: hello
# hi
# After:
# => nil