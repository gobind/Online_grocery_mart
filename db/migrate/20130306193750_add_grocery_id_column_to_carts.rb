class AddGroceryIdColumnToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :grocery_id, :integer
  end
end
