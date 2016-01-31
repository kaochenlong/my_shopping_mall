class AddSpecialOffToProducts < ActiveRecord::Migration
  def change
    add_column :products, :special_offer, :boolean, default: false
  end
end
