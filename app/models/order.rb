class Order < ApplicationRecord
  has_many :orderitems
  has_many :products, through: :orderitems
  has_many :users, through: :products

  def find_existing(orderitem)
    result = orderitems.find_by(order_id: self.id, product_id: orderitem.product_id)

    if result
      new_quantity = result.quantity + orderitem.quantity
      orderitem = result
      orderitem.assign_attributes(quantity: new_quantity)
    end
    return orderitem
  end
end
