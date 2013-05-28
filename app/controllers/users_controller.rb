class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.save
    sign_in(@user)
    redirect_to decks_path
  end
end
