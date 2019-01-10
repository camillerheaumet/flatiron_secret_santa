class GiftsController < ApplicationController
  before_action :set_gift, only: [:show, :edit, :update, :destroy]

  def index
    @gifts = Gift.all
  end

  def show
    @wishlist = current_user.wishlist
  end

  def new
    @gift = Gift.new
  end

  def create
    @wishlist = Wishlist.find_or_create_by(user: current_user)
    @gift = Gift.new(name: params[:gift][:name], price: params[:gift][:price], description: params[:gift][:description], wishlist_id: @wishlist.id)
    if @gift.valid?
      @gift.save
      redirect_to show_path
    else
      flash[:errors] = @gift.errors.full_messages
      redirect_to new_gift_path
    end
  end

  def edit
  end

  def update
    @gift.update(name: params[:gift][:name], price: params[:gift][:price], description: params[:gift][:description])
    redirect_to gift_path(@gift)
  end

  def destroy
    @gift.destroy
    redirect_to show_path
  end

  private

  def set_gift
    @gift = Gift.find(params[:id])
  end

  def gift_params
    params.require(:gift).permit(:name, :price, :description)
  end

end
