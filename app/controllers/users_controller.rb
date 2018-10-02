class UsersController < ApplicationController
  before_action :require_login, :only => [:show]

  def new
  end

  def create
    @user = User.create(user_params)
    return redirect_to root_path unless @user.save
    session[:user_id] = @user.id
    redirect_to controller: 'users', action: 'show'
  end

  def show
    @wishlist = @user.wishlist.all if @user.wishlist
    #We can then iterate over all gorups to show each memeber ina users groups
    @groups = @user.groups if @user.groups
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
