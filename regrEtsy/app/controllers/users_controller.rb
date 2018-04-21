class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find_by(id: params[:id])
    render_404 unless @user
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
  end

  def update
    # @user = User.find(params[:id])
    # @user.assign_attributes(user_params)
    # if @user.save
    #   redirect_to user_path(@user)
    # else
    #   render :edit
    # end
  end

private

  def user_params
    params.require(:user).permit(:name, :username, :password, :email)
  end

  def render_404
    render :file => "#{Rails.root}/public/404.html", layout: false, status: :not_found
  end
end
