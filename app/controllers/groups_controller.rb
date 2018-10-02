class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to author_path(@model)
    else
      #When new page renders, the @error object with params is passed to the view
      render :new
    end
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

  def group_params
    params.require(:group).permit(:name)
  end


end
