require "test_helper"

describe CartsController do
  describe "show" do
    it "sends success if the order exists" do
      order = Order.first
      get order_path(order)
      must_respond_with :success
    end

    it "sends success if the orders products exist" do
      order = Order.first
      product = Product.first
      orderitem = Orderitem.create!(product: product, order_id: order.id, quantity: 1)
      order.products.must_respond_with :success
    end

    it "sends success if the orderitems exist" do
      order = Order.first
      product = Product.first
    end
  end

  describe "update" do
    it "updates an existing order with valid data" do
      skip
    end

    it "sends failure for invalid data" do
      skip
    end

    it "removes a product from the cart" do
      skip
    end

    it "changes the quantity of an existing product in the cart" do
      skip
    end

    it "sends not_found for an order that does not exist" do
      skip
    end
  end

  describe "add_to_cart" do
    it "successfully adds in-stock products to the cart" do
      skip
    end

    it "does not add products to the cart that are out of stock" do
      skip
    end


  end

  describe "checkout" do
    it "renders the shipping and payment info form" do
      get checkout_path(Order.first)
      must_respond_with :success
    end
  end

  describe "finalize" do
    it "reduces the number of inventory for each product purchased" do
      order = Order.first
      product = Product.first
      old_stock_count = product.stock


    end

    it "changes the order status from 'pending' to paid" do
      skip #what is order status initialized as?
    end

    it "creates a Buyer Detail record" do
      order = Order.first
      payment_info = {
        email: "test@test.com",
        mailing_address: "123 Street",
        buyer_name: "Buyer Person",
        card_number: "1234567890",
        expiration: "01/01",
        cvv: "1234",
        zipcode: "12345",
        order_id: order.id
      }
      buyer = Buyerdetail.new(payment_info)
      post checkout_path(order.id)
    end

    it "responds with bad_request if the order has errors" do
      skip
    end
  end

  describe "order_details" do
    it "successfully renders the order details" do
      order = Order.first
      get order_path(order)
      must_respond_with :success
    end
  end

  describe "clear_cart" do
    it "clears the current cart" do
      #TODO where is this executed?
    end
  end
end
