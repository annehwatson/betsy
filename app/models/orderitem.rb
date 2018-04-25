class Orderitem < ApplicationRecord
  belongs_to :product
  belongs_to :order


  # def self.find_orderitem
  #   result1 = Orderitem.find_by(order_id: orderitem.order_id, product_id: orderitem.product_id)
  #
  #   if result
  #     result.quantity += orderitem.quantity
  #     return result
  #   else
  #     return orderitem
  #   end
  # end
end
