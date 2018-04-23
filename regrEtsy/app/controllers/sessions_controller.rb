class SessionsController < ApplicationController


  def new
    @user = User.new
  end

  def create
    auth_hash = request.env['omniauth.auth']

    if auth_hash['uid']
      @user = User.find_by(uid: auth_hash[:uid], provider: 'github')

      if @user.nil?
        @user = User.new(
          name: auth_hash['info']['name'],
          email: auth_hash['info']['email'],
          username: user_name(auth_hash['info']['email']),
          uid: auth_hash[:uid],
          provider: ['github'])

          if @user.save
            session[:user_id] = @user.id
            flash[:success] = "User #{@user.name} logged in successfully"
          else
            flash[:alert] = "User not created"
            redirect_to root_path
          end
          # User doesn't match anything in the DB
          # Attempt to create a new user
      else
        session[:user_id] = @user.id
        flash[:success] = "Logged in successfully"
        redirect_to root_path
      end

    else
      flash[:error] = "Could not log in"
      redirect_to root_path
    end
    redirect_to root_path
  end

  def logout
    if session[:user_id]
      session[:user_id] = nil
      # session.delete([:user_id])
      flash[:result_text] = "Successfully logged out"
      redirect_to root_path
    else
      flash[:error] = "User was not logged out successfully"
      redirect_to root_path
    end
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
