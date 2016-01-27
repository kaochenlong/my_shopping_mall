require 'rails_helper'

feature "Products", type: :feature do
  scenario "add a new product" do
    visit products_path
    click_link "New"
    expect(current_path).to eq new_product_path
    expect(page).to have_content "新增商品"

    fill_in "Title", with:"Ruby Product"
    fill_in "Description", with: "Hello, Ruby"
    fill_in "Price", with:100
    click_button "Create Product"

    expect(current_path).to eq products_path
    expect(page).to have_content "成功新增商品!"
  end
end
