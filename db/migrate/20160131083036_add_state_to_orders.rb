class AddStateToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :state, :string
  end
end
