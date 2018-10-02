class GiftsController < ApplicationController
  before_action :set_gift, only: [:show, :edit, :update, :destroy]

  def index
    @gifts = Gift.all
  end

  def show
  end

  def new
    @gift = Gift.new
  end

  def create
    @gift = Gift.create(gift_params)
    #info would come form the form
    # @user = User.find_by(id: session[:user_id])
    current_user.gifts << @gift
    redirect_to @gift
  end

  def edit
  end

  def update
    @gift.update(gift_params)
    redirect_to @gift
  end

  def destroy
    @gift.destroy
    redirect_to gifts_path
  end

  private

  def set_gift
    @gift = Gift.find(params[:id])
  end

  def gift_params
    params.require(:gift).permit(:name, :description)
  end

end
