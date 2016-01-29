class CartItem

  def initialize(product_id, quantity = 1)
    @product_id = product_id
    @quantity = quantity
  end

  def product_id
    @product_id
  end
end

