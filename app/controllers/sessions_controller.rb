class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_email(params[:session][:email])
    sign_in(user)
    cookies.signed[:user_id] = user.id
    redirect_to decks_path
  end

  def destroy
    cookies.delete(:user_id)
    redirect_to root_path
  end
end
