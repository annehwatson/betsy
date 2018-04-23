class Order < ApplicationRecord
  has_many :orderitems
  has_many :products, through: :orderitems, source: :product 
end
