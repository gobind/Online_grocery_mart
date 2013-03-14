class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.integer  "cart_id"
      t.integer  "grocery_id"
      t.integer  "quantity"
      t.string   "name"
      t.text     "description"
      t.string   "price"
      t.timestamps
    end
  end
end
