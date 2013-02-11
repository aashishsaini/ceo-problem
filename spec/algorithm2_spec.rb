require 'spec_helper'
require 'algorithm2'

describe 'Algorithm 2' do
  describe 'control examples' do
    specify "['a', 'b', 'c', 'ab', 'abc'], 'aabc'" do
      result = Algorithm2.find_possible_combinations(['a', 'b', 'c', 'ab', 'abc'], 'aabc')
      
      result.should have(3).items
      
      ['a abc', 'a a b c', 'a ab c'].each do |combination|
        result.should include(combination)
      end
    end
    
    specify "['a', 'b', 'c', 'ab', 'abc', 'bcx'], 'aabc'" do
      result = Algorithm2.find_possible_combinations(['a', 'b', 'c', 'ab', 'abc', 'bcx'], 'aabc')
      
      result.should have(3).items
      
      ['a abc', 'a a b c', 'a ab c'].each do |combination|
        result.should include(combination)
      end
    end
    
    specify "['a', 'b', 'c', 'ab', 'abc'], 'aabcx'" do
      result = Algorithm2.find_possible_combinations(['a', 'b', 'c', 'ab', 'abc'], 'aabcx')
      
      result.should be_empty
    end
  end
end
