# def compute
#   block_given? ? yield : "Does not compute."
# end

# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'

# # FE
def compute(arg = nil)
  block_given? ? yield(arg) : "Does not compute."
end

p compute(5) { |x| x + 3 } == 8
p compute('a') { |x| x + 'b' } == 'ab'
p compute == 'Does not compute.'