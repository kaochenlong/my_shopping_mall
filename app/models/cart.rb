class Cart

  def initialize
    @items = []
  end

  def add_item(product_id)
    @items << product_id
  end

  def empty?
    if @items.empty?
      return true
    else
      return false
    end
  end

end

