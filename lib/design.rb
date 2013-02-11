Product = Struct.new(:code, :price)

class Products
  include Enumerable

  def initialize(*items)
    @items = items.flatten
  end

  def each(&block)
    @items.each(&block)
  end
  
  def find_product_by_code(code)
    find { |product| product.code == code }
  end
end

class ShoppingCart
  include Enumerable
  
  def initialize
    @items = []
  end
  
  def add(item)
    @items << item
  end
  
  def each(&block)
    @items.each(&block)
  end
  
  def total
    @items.inject(0.0) do |total, product|
      total += product.price
    end
  end
end

class Rule
  def initialize(cart)
    @cart = cart
  end
  
  def method_missing(method, *args, &block)
    @cart.send(method, *args, &block)
  end
end

class FruitTeaRule < Rule
  def total
    teas = @cart.select { |item| item.code == 'FR' }
    @cart.total - (teas.count / 2 * teas[0].price)
  end
end

class StrawberryRule < Rule

  PRICE_WITH_DISCOUNT = 4.50

  def total
    strawberries = @cart.select { |item| item.code == 'SR' }
    if strawberries.count >= 3
      strawberry_price = strawberries[0].price
      @cart.total - strawberries.count * (strawberry_price - PRICE_WITH_DISCOUNT)
    else
      @cart.total
    end
  end
end

class Checkout
  def initialize(*rules)
    @products = nil
    @cart = rules.inject(ShoppingCart.new) do |items, rule|
      rule.new(items)
    end
  end
  
  def set_products(products)
    @products = products
  end
  
  def scan(code)
    if @products
      product = @products.find_product_by_code(code)
      @cart.add(product) if product
    end
  end
  
  def total
    @cart.total
  end
end
