class AddStatusToCart < ActiveRecord::Migration
  def change
    add_column :carts, :status, :string, :default => 'open'
  end
end
