require 'rails_helper'

RSpec.describe CartItem, type: :model do
  let(:cart) { Cart.new }

  describe "calculator" do
    it "item can calculate it's total price itself" do
      p = create(:ruby_book, price: 80)
      3.times { cart.add_item(p.id) }

      expect(cart.items.first.price).to be 240
    end
  end

# cart item
#* Some Special Event (e.g. 10% off on XMas), Optional.

end
