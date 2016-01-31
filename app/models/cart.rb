class Cart
  attr_reader :items

  def initialize(items = [])
    @items = items
  end

  def add_item(id)
    # find item
    item = items.find { |t| t.product_id == id }

    # if item exists, + quantity
    # else push a new item
    if item
      item.increment
    else
      items << CartItem.new(id)
    end
  end

  def empty?
    items.empty?
  end

  def serialize
    {
      "cart" => { "items" => items.map { |t| {"product_id" => t.product_id , "quantity" => t.quantity} } }
    }
  end

  def self.build_from_hash(hash)
    if hash.nil?
      new []
    else
      new hash["cart"]["items"].map { |item_hash|
        CartItem.new(item_hash["product_id"], item_hash["quantity"])
      }
    end
  end

  def total_price
    total = items.inject(0) { |s, item| s + item.price }

    # Use Strategy Pattern!
    total = total * 0.9 if xmas?
    total
  end

  private
  def xmas?
    Time.now.month == 12 and Time.now.day == 25
  end
end
