class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.string :name
      t.string :tel
      t.string :address
      t.string :email

      t.timestamps null: false
    end
  end
end
