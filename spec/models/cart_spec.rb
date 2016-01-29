require 'rails_helper'

RSpec.describe Cart, type: :model do

  describe "add or get item from cart" do

    context "add 1 item" do
      it "Add a item to cart, then the cart won't be empty." do
        cart = Cart.new
        expect(cart).to be_empty

        cart.add_item(1)
        expect(cart).not_to be_empty
      end
    end

    context "add more same item" do
      it "Add more same items to cart, but item count won't change" do
        cart = Cart.new

        3.times { cart.add_item(1) }
        5.times { cart.add_item(2) }

        expect(cart.items.length).to be 2
        expect(cart.items.first.product_id).to be 1
        expect(cart.items.first.quantity).to be 3
        expect(cart.items.second.product_id).to be 2
        expect(cart.items.second.quantity).to be 5
      end
    end

    #context "get item from cart" do
      #it "After the item added to cart, you can get the item back from the cart."

    #end

  end

#* Calculate total price of this cart.
#* Can serialize all it's items to hash structure for further usage.
#* Cart also rebuilt by import a hash structure.

# cart item
#* Every item can calculate it's total price itself.
#* Some Special Event (e.g. 10% off on XMas), Optional.

end
