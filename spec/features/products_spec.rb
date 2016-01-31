require 'rails_helper'

RSpec.feature "Products", type: :feature do
  before :each do
    5.times { create(:product) }
  end

  scenario "front-end page" do
    visit products_path
    first(".product_item").click_link("放到購物車")
    expect(current_path).to eq products_path
    expect(page).to have_content "感謝您! 已加到購物車!"
  end
end

