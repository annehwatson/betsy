class Product < ApplicationRecord

has_and_belongs_to_many :categories
has_many :orderitems
has_many :included_in_orders, through: :orderitems, source: :order
#has_many :reviews

def sufficient_stock(quantity)
  self.stock >= quantity
end

def decrement_stock(quantity)
  self.stock -= quantity
  self.save
end

end
