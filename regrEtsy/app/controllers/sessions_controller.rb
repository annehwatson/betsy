class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def login
    auth_hash = request.env['omniauth.auth']

    @user = User.login(auth_hash)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "User #{@user.username} successfully logged in"
      redirect_to root_path
    else
      flash[:error] = "Could not log in"
      redirect_to root_path
    end
  end

  def logout
    session[:user_id] = nil
    # session.delete([:user_id])
    flash[:success] = "Successfully logged out"
    redirect_to root_path
  end
end



    # @user = User.find_by(name: params[:user][:name])
    #
    # if @user
    #   session[:user_id] = @user.id
    #   flash[:success] = "Successfully logged in as existing user #{@user.name}"
    #
    # elsif @user.nil?
    #     flash[:alert] = "Must sign up to login"
    #     redirect_to new_user_path(@user)
    # else
    #   @user = User.new(name: params[:user][:name])
    #
    #   if @user.save
    #     session[:user_id] = @user.id
    #     flash[:success] = "Successfully created new user #{@user.name} with ID #{@user.id}"
      # else
      #   flash.now[:failure] = "Could not log in"
      #   @user.errors.messages
      #   @user.name = "please enter a username"
      #   render :new, status: :failure
      #   return
      # end
