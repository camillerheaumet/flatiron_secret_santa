class GiftsController < ApplicationController
  def index
    @gifts = list
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    @gift.destroy
    redirect_to gifts_path
  end

  private

  def list
    Gift.all.select do |gift|
      gift.wish_list.user == user
    end
  end
end
