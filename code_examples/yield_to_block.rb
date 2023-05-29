class List
  attr_reader :list

  def initialize(*items)
    @list = items
  end

  def iterate
    i = 0
    while i < list.size
      yield list[i]
      i += 1
    end
    list
  end
end

p List.new(1, 2, 3, 4).iterate { |x| p x }
