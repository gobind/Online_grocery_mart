class Grocery < ActiveRecord::Base
  attr_accessible :name, :price, :description
  belongs_to :carts
  validates :name, :price, :presence => true
end
