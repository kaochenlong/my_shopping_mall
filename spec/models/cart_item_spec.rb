require 'rails_helper'

RSpec.describe CartItem, type: :model do
  let(:cart) { Cart.new }

  describe "calculator" do
    it "item can calculate it's total price itself" do
      p1 = create(:product, :ruby_book, price: 80)
      p2 = create(:product, :php_book, price: 200)
      3.times { cart.add_item(p1.id) }
      4.times { cart.add_item(p2.id) }
      2.times { cart.add_item(p1.id) }

      expect(cart.items.first.price).to be 400
      expect(cart.items.second.price).to be 800
    end
  end
end
