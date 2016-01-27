class AddIsAvailableToExampleUser < ActiveRecord::Migration
  def change
    add_column :example_users, :is_available, :boolean, default: false
  end
end
