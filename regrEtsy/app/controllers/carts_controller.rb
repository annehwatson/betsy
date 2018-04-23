class CartsController < ApplicationController
  def show
    @cart
  end

  def edit; end

  def update
    @cart.assign_attributes(product_params)

    if @pcart.save
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
end
