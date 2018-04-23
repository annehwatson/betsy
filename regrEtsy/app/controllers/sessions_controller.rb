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

  end
