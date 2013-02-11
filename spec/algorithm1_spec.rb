require 'spec_helper'
require 'algorithm1'

describe 'Algorithm 1' do
  describe 'requirements' do
    it 'returns array' do
      Algorithm1.find_counts(['a']).should be_instance_of(Array)
    end
  
    it 'returns array of Item instances' do
      Algorithm1.find_counts(['a'])[0].should be_instance_of(Item)
    end
  
    it 'counts appearens of strings in input' do
      result = Algorithm1.find_counts(['c', 'b', 'a'])
      result.should_not be_empty
      
      result.each do |item|
        item.count.should == 1
      end
    end
  
    it 'sorts result array by count attribute in desc order' do
      result = Algorithm1.find_counts(['b', 'b', 'a'])
      result[0].count.should == 2
      result[1].count.should == 1
    end
  end
  
  describe 'Item' do
    it 'sorts descending by count' do
      a = Item.new('abc', 2)
      b = Item.new('a', 5)
      [a, b].sort.should == [b, a]
    end
    
    it 'sorts by word if counts are equal' do
      a = Item.new('abc', 2)
      b = Item.new('abcd', 2)
      c = Item.new('a', 5)
      [a, b, c].sort.should == [c, a, b]
    end
  end
  
  describe 'control examples' do
    specify "['c', 'b', 'a']" do
      result = Algorithm1.find_counts(['c', 'b', 'a'])
      
      result[0].word.should == 'a'
      result[0].count.should == 1
      
      result[1].word.should == 'b'
      result[1].count.should == 1
      
      result[2].word.should == 'c'
      result[2].count.should == 1
    end
    
    specify "['abc', 'xyz', 'def', 'xyz', 'abc']" do
      result = Algorithm1.find_counts(['abc', 'xyz', 'def', 'xyz', 'abc'])
      
      result[0].word.should == 'abc'
      result[0].count.should == 2
      
      result[1].word.should == 'xyz'
      result[1].count.should == 2
      
      result[2].word.should == 'def'
      result[2].count.should == 1
    end
  end
end
