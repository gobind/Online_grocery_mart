class AddCartIdColumnToGrocery < ActiveRecord::Migration
  def change
    add_column :groceries, :cart_id, :integer, :default => nil
  end
end
