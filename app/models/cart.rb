class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :groceries

  validates :customer_name, :customer_email, :presence => true
end
