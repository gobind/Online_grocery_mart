class Cart < ActiveRecord::Base
  attr_accessible :customer_name, :customer_email, :grocery_id, :status
  has_many :groceries
  has_many :cart_items, :dependent => :destroy
  
#validates :grocery_id, :presence => true

end
