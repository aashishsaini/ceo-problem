require 'spec_helper'
require 'design'

describe 'Design' do
  describe 'control examples' do
    
    let(:checkout) { Checkout.new(FruitTeaRule, StrawberryRule) }
    
    before do
      checkout.set_products(
        Products.new(
          Product.new('FR', 3.11),
          Product.new('SR', 5.00),
          Product.new('CF', 11.23)
        )
      )
    end
    
    specify "FR, SR, FR, FR, CF total $22.45" do
      checkout.scan('FR')
      checkout.scan('SR')
      checkout.scan('FR')
      checkout.scan('FR')
      checkout.scan('CF')
      
      checkout.total.should == 22.45
    end
    
    specify "FR, FR total $3.11" do
      checkout.scan('FR')
      checkout.scan('FR')
      
      checkout.total.should == 3.11
    end
    
    specify "SR, SR, FR, SR total $16.61" do
      checkout.scan('SR')
      checkout.scan('SR')
      checkout.scan('FR')
      checkout.scan('SR')
      
      checkout.total.should == 16.61
    end
  end
  
  describe 'Units' do
    describe 'ShoppingCart' do
      it 'calculates total' do
        cart = ShoppingCart.new
        
        cart.add(Product.new('FR', 3.11))
        cart.add(Product.new('SR', 5.00))
        
        cart.total.should == 8.11
      end
    end
  end
end
