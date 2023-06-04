def validBraces(s)
  braces = "([{".chars.zip(")]}".chars).to_h

  s
    .chars
    .each_with_object([]) do |b, stack|
      if braces.keys.include?(b)
        stack << b
      elsif braces.values.include?(b)
        return false if b != braces[stack.last]
        stack.pop
      end
    end
    .empty?
end
