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
  end

  def create_user
    @group = Group.find(params[:id])
    @user = User.new(name: params[:user][:name], email: params[:user][:email], password: "password", password_confirmation: "password")
    if @user.save
      Invitation.create(user_id: @user.id, group_id: @group.id, accepted?: false)
      redirect_to group_path(@group.id)
    else
      redirect_to add_user_path
    end
    # name: params[:group]["users_attributes"]["0"]["name"], email: params[:group]["users_attributes"]["0"]["email"]
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
