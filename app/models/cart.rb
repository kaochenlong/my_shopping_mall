class Cart

  def initialize
    @items = []
  end

  def add_item(id)

    # find item
    item = @items.find { |item| item.product_id == id }

    # if item exists, + quantity
    # else push a new item
    if item
      item.increment
    else
      @items << CartItem.new(id)
    end

    #@items << product_id
  end

  def empty?
    @items.empty?
  end

  def items
    @items
  end
end
