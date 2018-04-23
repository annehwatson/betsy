class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cart
  before_action :find_product

  def put_product_in_cart

  end

  private
  def require_login
    @user = User.find_by(id: session[:user_id])
    head :unauthorized unless @user
  end

  def set_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end

  def find_product
    if params[:product_id]
      @product = Product.find_by(id: params[:product_id])
      head :not_found unless @product
    end
  end

end
