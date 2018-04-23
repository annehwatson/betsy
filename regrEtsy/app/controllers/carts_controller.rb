class CartsController < ApplicationController
  def show
    @cart
  end

  def edit
    @cart
  end

  def updated
    @cart
  end

  def add_to_cart
    flash[:status] = :failure
    quantity = params[:quantity].to_i
    if @product.sufficient_stock(quantity)
      quantity.times do
        @cart.products << @product
        @product.stock -= 1
        @product.save
      end

      if @cart.save
        flash[:status] = :success
        flash[:result_text] = "Successfully added #{quantity} #{@product.name} to cart"
      end
    else
      flash[:result_text] = "Could not add item to cart"
      flash[:messages] = @cart.errors.messages
    end

    redirect_back fallback_location: product_path(@product)
  end
end
