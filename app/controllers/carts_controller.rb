class CartsController < ApplicationController
  def show
    @order
    @products = @order.products
  end

  def edit; end

  def update
    @order.assign_attributes(product_params)

    if @order.save
      redirect_to cart_path(@order)
    else
      render :edit, status: :bad_request
    end
  end

  def add_to_cart
    flash[:status] = :failure
    quantity = params[:quantity].to_i
    if @product.sufficient_stock(quantity)
      orderitem = Orderitem.new(product: @product, order_id: @order.id, quantity: quantity)

      if orderitem.save
        flash[:status] = :success
        flash[:result_text] = "Successfully added #{quantity} #{@product.name} to cart"
        #this logic may belong in order, should we
        #decrement when added to cart, or when an order
        #is marked complete?
      end
    else
      flash[:result_text] = "Could not add item to cart"
      flash[:messages] = orderitem.errors.messages
    end

    redirect_back fallback_location: product_path(@product)
  end

  def checkout
    @paymentinfo = Buyerdetail.new
  end

  def finalize
    @paymentinfo = Buyerdetail.new(payment_params)
    @paymentinfo.order_id = @order.id

    if @paymentinfo.save
      @order.status = :paid

      @order.products.each do |product|
        quantity = Orderitem.find_by(order_id: @order.id, product_id: product.id).quantity
        product.decrement_stock(quantity)
      end

      if @order.save
        flash[:status] = :success
        flash[:result_text] = "Successfully completed Order # #{@order.id}"

        redirect_to order_path(@order)
      else
        flash.now[:status] = :failure
        flash.now[:result_text] = "Could not complete order."
        flash.now[:messages] = @paymentinfo.errors.messages && @order.errors.messages
        render :checkout, status: :bad_request
      end
    end
  end

  def order_details
    @order
    @orderitems = Orderitem.where(order_id: @order.id)
    @customer = Buyerdetail.find_by(@order.buyerdetails_id)
  end

  private
  def payment_params
    params.require(:buyerdetail).permit(:email, :mailing_address, :buyer_name, :card_number, :expiration, :cvv, :zipcode)
  end
end
