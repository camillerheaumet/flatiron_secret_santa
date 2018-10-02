class GroupsController < ApplicationController

  def new
    @group = Group.new
    # 7.times { @group.users.build}
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      session[:group_id] = @group.id
      redirect_to add_user_path
    else
      #When new page renders, the @error object with params is passed to the view
      render :new
    end
  end

  def add_user
    @group = Group.find_by(id: session[:group_id])
    @group.users.build
  end

  def add_user_to_group
    raise params.inspect
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
    params.require(:group).permit(:name)
  end


end
