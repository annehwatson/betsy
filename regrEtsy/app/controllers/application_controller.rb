class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_order
  before_action :find_product
  before_action :find_user

  private
  def require_login
    @user = User.find_by(id: session[:user_id])
    head :unauthorized unless @user
  end

  def find_user
    if session[:user_id]
      @login_user = User.find_by(id: session[:user_id])
    end
  end

  def render_404
    raise ActionController::RoutingError.new('Not Found')
  end

  def user_name(auth_hash)
    email = auth_hash.split('@')
    return email[0]
  end

  def set_order
    @order = Order.find_by(id: session[:order_id])
    unless @order || @order.status == "pending"
      @order = Order.create(status: :pending)
      session[:order_id] = @order.id
    end
  end

  def find_product
    if params[:product_id]
      @product = Product.find_by(id: params[:product_id])
      head :not_found unless @product
    end
  end

end
