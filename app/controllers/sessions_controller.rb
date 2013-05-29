class SessionsController < ApplicationController
  def new
  end
  
  def create
    if !request.env["omniauth.auth"].nil?
      auth = request.env["omniauth.auth"]
      user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
      session[:user_id] = user.id
    else
      user = User.find_by_email(params[:session][:email])
      sign_in(user)
      cookies.signed[:user_id] = user.id
    end
    redirect_to decks_path
  end

  def destroy
    if cookies[:user_id].nil?
      session[:user_id] = nil
    else
      cookies.delete(:user_id)
    end
    redirect_to root_path, notice: "Signed out!"
  end
end

