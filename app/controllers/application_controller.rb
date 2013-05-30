class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def current_user
    if cookies[:user_id]
      user_id = cookies.signed[:user_id]
      User.find_by_id(user_id)
    else
      User.find(session[:user_id]) if session[:user_id]
    end
  end
  helper_method :current_user
  
  def sign_in(user)
    cookies.signed[:user_id] = user.id
  end
  
  def authenticate
    if !signed_in?
      redirect_to root_path
    end
  end
  
  def signed_in?
    current_user
  end
  helper_method :signed_in?
  
end