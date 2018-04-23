class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def login
    @user = User.find_by(name: params[:user][:name])

    if @user
      session[:user_id] = @user.id
      flash[:success] = "Successfully logged in as existing user #{@user.name}"
    else

      # use strong params instead on refactor
      # @user = User.new(name: params[:user][:name])
      #
      # if @user.save
      #   session[:user_id] = @user.id
      #   flash[:success] = "Successfully created new user #{@user.name} with ID #{@user.id}"
      # else
      # flash.now[:status] = :failure
      flash.now[:failure] = "Could not log in"
      @user.errors.messages
      @user.name = "please enter a username"
      render :new, status: :failure
      return
    end
    redirect_to user_path(@user)
  end

  def logout
    session[:user_id] = nil
    # session.delete([:user_id])
    flash[:success] = "Successfully logged out"
    redirect_to root_path
  end

  def add_cart_product
    @product = Product.find_by(id: params[:product][:id])

    if @product
      session[:product_id] = @product.id
      session[:quantity] = params[:quantity]
      redirect_to add_to_cart_path

    else
      flash[:status] = :failure
      flash[:result_text] = "Could not add item to cart"
      flash[:messages] = @product.errors.messages
    end
    redirect_to product_path(@product)
  end
end
