class CartsController < ApplicationController
  def show
    @cart
  end

  def edit; end

  def update
    @cart.assign_attributes(product_params)

    if @cart.save
      redirect_to cart_path(@cart)
    else
      render :edit, status: :bad_request
    end
  end

  def add_to_cart
    flash[:status] = :failure
    quantity = params[:quantity].to_i
    if @product.sufficient_stock(quantity)
      quantity.times do
        @cart.products << @product
      end

      if @cart.save
        flash[:status] = :success
        flash[:result_text] = "Successfully added #{quantity} #{@product.name} to cart"
        #this logic may belong in order, should we
        #decrement when added to cart, or when an order
        #is marked complete?
        @product.decrement_stock(quantity)
      end
    else
      flash[:result_text] = "Could not add item to cart"
      flash[:messages] = @cart.errors.messages
    end

    redirect_back fallback_location: product_path(@product)
  end

  def checkout
    @paymentinfo = Buyerdetail.new
  end

  def finalize
    @paymentinfo = Buyerdetail.new(payment_params)
    if session[:order_id]
      @order = Order.find_by(session[:order_id])
    else
      @order = Order.create
    end
    @paymentinfo.order_id = @order.id

    if @paymentinfo.save
      flash[:status] = :success
      flash[:result_text] = "Successfully completed Order # #{@order.id}"
      redirect_to order_path(@order)
    else
      flash.now[:status] = :failure
      flash.now[:result_text] = "Could not complete order."
      flash.now[:messages] = @paymentinfo.errors.messages
      render :checkout, status: :bad_request
    end
  end

  def order_details
    @order = Order.find_by(session[:order_id])
  end

  private
  def payment_params
    params.require(:buyerdetail).permit(:email, :mailing_address, :buyer_name, :card_number, :expiration, :cvv, :zipcode)
  end
end
