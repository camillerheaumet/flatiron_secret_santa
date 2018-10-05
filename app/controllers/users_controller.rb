class UsersController < ApplicationController
  before_action :require_login, :only => [:show]

  def new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to controller: 'users', action: 'show'
      flash[:success] = 'Account created'
    elsif @user.errors.full_messages.include?("Email has already been taken")
      flash[:errors] = ["Oups... it seams that you already have an account!"]
      redirect_to signup_path
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to signup_path
    end
  end

  def show
    @wishlist = @user.wishlist if @user.wishlist
    #We can then iterate over all gorups to show each memeber ina users groups
    @groups = @user.groups if @user.groups
    if @gifts
      wishlist_gifts = []
      @wishlist.gifts.each do |gift|
        wishlist_gifts << gift.name
      end
    end
    flash[:notices] = wishlist_gifts

    #if user.group if invition.accepted? == yes, we display group
    #@user.groups.select {|group| group.accepted == true }

  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
