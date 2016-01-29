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

        result_hash = {
          cart: {
            items: [
              {product_id: 2, quantity: 3},
              {product_id: 5, quantity: 4}
            ]
          }
        }

        expect(cart.serialize).to eq result_hash
      end
    end

    context "hash to cart" do
      it "rebuilt by import a hash structure" do

        result_hash = {
          cart: {
            items: [
              {product_id: 2, quantity: 3},
              {product_id: 5, quantity: 4}
            ]
          }
        }

        cart = Cart.build_from_hash(result_hash)
        expect(cart.items.first.product_id).to be 2
        expect(cart.items.first.quantity).to be 3
        expect(cart.items.second.product_id).to be 5
        expect(cart.items.second.quantity).to be 4
      end
    end
  end


#* Calculate total price of this cart.

# cart item
#* Every item can calculate it's total price itself.
#* Some Special Event (e.g. 10% off on XMas), Optional.

end
