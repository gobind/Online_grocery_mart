class Grocery < ActiveRecord::Base
  attr_accessible :name, :price, :description
  has_many :cart_items
  validates :name, :price, :presence => true
end
