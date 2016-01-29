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

    #context "add more same item" do
      #it "Add more same items to cart, but the item count won't change"
    #end

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
