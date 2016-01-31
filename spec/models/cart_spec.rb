require 'rails_helper'

RSpec.describe Cart, type: :model do
  let(:cart) { Cart.new }

  describe "add or get item from cart" do
    context "add 1 item" do
      it "Add a item to cart, then the cart won't be empty." do
        expect(cart).to be_empty

        cart.add_item(1)
        expect(cart).not_to be_empty
      end
    end

    context "add more same item" do
      it "Add more same items to cart, but item count won't change" do
        3.times { cart.add_item(1) }
        5.times { cart.add_item(2) }
        2.times { cart.add_item(3) }

        expect(cart.items.length).to be 3
        expect(cart.items.first.quantity).to be 3
        expect(cart.items.second.quantity).to be 5
      end
    end

    context "get item from cart" do
      it "item added to cart, get the item back from the cart." do
        p1 = create(:ruby_book)
        p2 = create(:php_book)

        4.times { cart.add_item(p1.id) }
        2.times { cart.add_item(p2.id) }

        expect(cart.items.first.product_id).to be p1.id
        expect(cart.items.second.product_id).to be p2.id
        expect(cart.items.first.product).to be_a Product
      end
    end
  end

  describe "cart serialize" do
    context "cart to hash" do
      it "serialize it's items to hash structure" do
        3.times { cart.add_item(2) }
        4.times { cart.add_item(5) }

        expect(cart.serialize).to eq build(:session_hash)
      end
    end

    context "hash to cart" do
      it "rebuilt by import a hash structure" do
        cart = Cart.build_from_hash(build(:session_hash))

        expect(cart.items.first.product_id).to be 2
        expect(cart.items.first.quantity).to be 3
        expect(cart.items.second.product_id).to be 5
        expect(cart.items.second.quantity).to be 4
      end
    end
  end

  describe "calculator" do
    it "calculate total price of this cart" do
      p1 = create(:ruby_book, price: 1000)
      p2 = create(:php_book, price: 100)

      3.times {
        cart.add_item(p1.id)
        cart.add_item(p2.id)
      }

      expect(cart.total_price).to be 3300
    end
  end

  describe "special events" do
    context "XMas" do
      it "10% off on XMas" do
        p = create(:ruby_book, price: 10)
        10.times { cart.add_item(p.id) }

        Timecop.travel(2015, 12, 25) do
          expect(cart.total_price).to be (100 * 0.9)
        end
      end
    end
  end

  # HOMEWORK
  describe "Special Offer" do
    it "滿千折百" do
      p = create(:ruby_book, price: 300, special_offer: true)
      3.times { cart.add_item(p.id) }
      expect(cart.total_price).to be 900

      cart.add_item(p.id)
      expect(cart.total_price).to be 1100
    end
  end
end
