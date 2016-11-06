class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private
# #redirects unsigned users
  def require_sign_in
    unless current_user
      flash[:alert] = "You must be logged in to do that"
# #redirect unsigned users to sign in page
      redirect_to new_session_path
    end
  end

end
