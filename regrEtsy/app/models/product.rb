class Product < ApplicationRecord

has_and_belongs_to_many :categories
has_many :orderitems
has_many :included_in_orders, through: :orderitems, source: :order
has_many :reviews
belongs_to :user

validates :name, presence: true, uniqueness: true, format: { with: /^[a-zA-Z_\s]*$/ }

# This price validation allows values with an optional decimal place (if the decimal is present, no more than 2 digits must follow) and it can be up to 20 digits long
validates :price, presence: true, numericality: true, format: { with: /^\d{1,20}(\.\d{0,2})?$/ }, greater_than: 0


def sufficient_stock(quantity)
  self.stock >= quantity
end

def decrement_stock(quantity)
  self.stock -= quantity
  self.save
end

end
