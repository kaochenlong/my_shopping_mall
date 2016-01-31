require 'rails_helper'

RSpec.feature "Admin::Products", type: :feature do
  let (:user) { create(:user) }

  scenario "redirect to user sign in page if not sign in" do
    visit admin_products_path
    expect(current_path).to eq new_user_session_path
  end

  scenario "add a new product if user sign in" do
    # sign in
    login_as user

    visit admin_products_path
    expect(page).to have_content user.email

    click_link "New"
    expect(current_path).to eq new_admin_product_path
    expect(page).to have_content "新增商品"

    fill_in "Title", with:"Ruby Product"
    fill_in "Description", with: "Hello, Ruby"
    fill_in "Price", with:100
    click_button "Create Product"

    expect(current_path).to eq admin_products_path
    expect(page).to have_content "成功新增商品!"
  end
end
