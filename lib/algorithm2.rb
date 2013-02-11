module Algorithm2
  extend self
  
  def find_possible_combinations(dictionary, target)
    (1..dictionary.length).to_a.inject([]) do |combinations, num_repeats|
      combinations + dictionary.repeated_permutation(num_repeats).select do |e|
        e.join == target
      end
    end.map do |element|
      element.join(' ')
    end
  end
end