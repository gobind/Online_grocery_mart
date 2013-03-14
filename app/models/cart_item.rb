class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :grocery
  # attr_accessible :title, :body
end
