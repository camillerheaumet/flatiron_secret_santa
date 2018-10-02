class GiftsController < ApplicationController

  def new
    @gift = Gift.new
    #create a new form
    #name field
    #description field



  end

  def create
    #info would come form the form
    @user = User.find_by(id: session[:user_id])
    @user.gifts << {name: "iPhoneX", description: "The perfect gift"}
  end

  # def show
  # end

  def edit

  end

  def update

  end

  def destroy

  end

  private 

end
