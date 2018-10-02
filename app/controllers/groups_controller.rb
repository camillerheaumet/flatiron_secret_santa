class GroupsController < ApplicationController

  def new
    @group = Group.new
    7.times { @group.users.build}
  end

  def create
    raise params.inspect
    #Create the group
    #Create a user
    redirect to "acceptance"
  end

  # def show
  # end

  def acceptance
    #if they are on this controller, accepted? == false
    #create a checkbox, that allows them to toggle to true or reject invitation
    #If toggle true, change accepted to true and direct to controller: user action: show
    #If toggle false, remove user from group
  end

  def show
    #Once we have created a group, we create a show page
    #before action redirect them to
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def group_params
    params.require(:group).permit(:name, user_attributes: [:name, :email])
  end


end
