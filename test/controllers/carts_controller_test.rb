require "test_helper"

describe CartsController do
  describe "show" do
    it "sends success if the order exists" do
      get order_path(Order.first)
      must_respond_with :success
    end

    it "sends success if the orders products exist" do

    end

    it "sends success if the orderitems exist" do

    end
  end

  describe "edit" do
    it "sends success if the order exists" do
      get edit_order_path(Order.first)
      must_respond_with :success
    end

    it "sends not_found if the order does not exist" do
      order_id = Order.last.id + 1

      get edit_order_path(order_id)

      must_respond_with :not_found
    end
  end

  describe "update" do
    it "updates an existing order with valid data" do

    end

    it "sends failure for invalid data" do

    end

    it "removes a product from the cart" do

    end

    it "changes the quantity of an existing product in the cart" do

    end

    it "sends not_found for an order that does not exist" do

    end
  end

  describe "add_to_cart" do
    it "successfully adds in-stock products to the cart" do

    end

    it "does not add products to the cart that are out of stock" do

    end


  end

  describe "checkout" do
    #TODO
  end

  describe "finalize" do
    it "reduces the number of inventory for each product purchased" do

    end

    it "changes the order status from 'pending' to paid" do

    end

    it "creates a Buyer Detail record" do

    end
  end

  describe "order_details" do
    #TODO
  end

  describe "clear_cart" do
    it "clears the current cart" do
      #TODO
    end
  end
end
