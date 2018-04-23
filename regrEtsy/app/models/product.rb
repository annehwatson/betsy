class Product < ApplicationRecord

has_and_belongs_to_many :categories
has_and_belongs_to_many :carts

def sufficient_stock(quantity)
  self.stock >= quantity
end

def decrement_stock(quantity)
  self.stock -= quantity
  self.save
end

end
