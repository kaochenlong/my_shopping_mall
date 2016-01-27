class CreateExampleUsers < ActiveRecord::Migration
  def change
    create_table :example_users do |t|
      t.string :name
      t.string :email
      t.integer :age
      t.string :password

      t.timestamps null: false
    end
  end
end
