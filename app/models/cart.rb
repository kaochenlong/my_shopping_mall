class Cart
  attr_reader :items

  def initialize(items = [])
    @items = items
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

  def serialize
    items = @items.map { |item|
      {product_id: item.product_id , quantity: item.quantity}
    }

    {
      cart: { items: items }
    }
  end

  def self.build_from_hash(hash)
    if hash.nil?
      items = []
    else
      items = []
      hash[:cart][:items].each do |item_hash|
        items << CartItem.new(item_hash[:product_id], item_hash[:quantity])
      end
    end

    Cart.new(items)
  end

end

