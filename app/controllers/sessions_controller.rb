class SessionsController < ApplicationController
    skip_before_action :require_login
    skip_before_action :check_user

  def new
    @user = User.new
  end

  def create
    auth_hash = request.env['omniauth.auth']
    # if auth_hash['uid']
      @user = User.find_by(uid: auth_hash[:uid], provider: 'github')

      if @user
        session[:user_id] = @user.id
        flash[:success] = "Logged in successfully"
      else
        @user = User.new(
          name: auth_hash['info']['name'],
          email: auth_hash['info']['email'],
          username: user_name(auth_hash['info']['email']),
          uid: auth_hash[:uid],
          provider: ['github'])
          @user.save

          if @user.save
            session[:user_id] = @user.id
            flash[:success] = "User #{@user.name} added"
          else
            flash[:error] = "User not created"
          end
      end
    redirect_to root_path
  end


  def logout
    if session[:user_id]
      session[:user_id] = nil
      # session.delete([:user_id])
      flash[:result_text] = "Successfully logged out"
      redirect_to root_path
    end
  end
end
