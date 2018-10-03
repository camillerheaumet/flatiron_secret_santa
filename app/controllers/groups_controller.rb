class GroupsController < ApplicationController

  def new
    @group = Group.new
    # 7.times { @group.users.build}
  end

  def create
    # raise params.inspect
    @group = Group.new(group_params)
    @user.groups.build(name: params[:group][:name], budget: params[:group][:budget])
    if @group.save
      redirect_to group_path(@group.id)
    else
      #When new page renders, the @error object with params is passed to the view
      render :new
    end
  end


  def add_user
    @group = Group.find(params[:id])
    # @user.groups << @group
  end

  def create_user
    @group = Group.find(params[:id])
    @user = User.new(name: params[:group][:users_attributes]["0"][:name], email: params[:group][:users_attributes]["0"][:email], password: "password", password_confirmation: "password")
    if @user.save
      Invitation.create(user_id: @user.id, group_id: @group.id, accepted?: false)
      redirect_to group_path(@group.id)
    else
      redirect_to add_user_path
    end

    # name: params[:group]["users_attributes"]["0"]["name"], email: params[:group]["users_attributes"]["0"]["email"]
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
    @group = Group.find(params[:id])

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def group_params
    params.require(:group).permit(:name, :budget, user_attributes: [:name, :email])
  end


end
