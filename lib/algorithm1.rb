class Item < Struct.new(:word, :count)
  include Comparable
  
  def <=>(other)
    if (count <=> other.count) == 0
      word <=> other.word
    else
      -1 * (count <=> other.count)
    end
  end
end

module Algorithm1
  extend self

  def find_counts(input_array)
    input_array.inject({}) do |counts, word|
      counts[word] ||= 0
      counts[word] += 1
      counts
    end.map do |word, count|
      Item.new(word, count)
    end.sort
  end
end
