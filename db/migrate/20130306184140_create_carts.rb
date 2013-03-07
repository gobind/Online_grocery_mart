class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.string :customer_name
      t.string :customer_email
      t.timestamps
    end
  end
end
