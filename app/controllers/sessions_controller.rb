class SessionsController < ApplicationController

  def new
  end

  def create
 # #search db for user with email address in params hash
    user = User.find_by(email: params[:session][:email].downcase)

 # #verify user is not nil and password matches
    if user && user.authenticate(params[:session][:password])
      create_session(user)
      flash[:notice] = "Welcome, #{user.name}!"
      redirect_to root_path
    else
      flash.now[:alert] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
 # #define destroy
    destroy_session(current_user)
    flash[:notice] = "You've been signed out, come back soon!"
    redirect_to root_path
  end

end
