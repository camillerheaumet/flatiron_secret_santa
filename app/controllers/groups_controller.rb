class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def new
    @group = Group.new
    # 7.times { @group.users.build}
  end

  def create
    # raise params.inspect
    @group = Group.new(name: params[:group][:name], budget: params[:group][:budget])
    # @user.groups.build(name: params[:group][:name], budget: params[:group][:budget])

    if @group.save
      Invitation.create(user_id: @user.id, group_id: @group.id, accepted?: false)
      #@group.users << current_user
      # Invitation.create(user_id: current_user.id, group_id: @group.id, accepted?: false)
      @group.users << current_user
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
    # raise
    #Once we have created a group, we create a show page
    #before action redirect them to
    @group = Group.find(params[:id])
  end

  def make_draw
    @group = Group.find(params[:id])
    if @group.users.length > 4
      @draws = @group.draw_order
        # send_draw(@group)
      render :show
      # redirect_to group_path(@group.id)
      #call send draw
    else
      flash[:errors] = ["You need at least 5 participants. Please add #{5-@group.users.length} more participants."]
      redirect_to group_path(@group)
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @group.destroy
    redirect_to show_path
  end

  private

  def group_params
    params.require(:group).permit(:name, :budget, user_attributes: [:name, :email])
  end

  def set_group
    @group = Group.find(params[:id])
  end

  # def send_draws(draws)
  #     draws.each do |draw|
  #       draw.each do |x, y|
  #         draw = Draw.new(giver: x, receiver: y)
  #         @groups.draws << draw
  #         draw.save
  #       end
  #     end
  #
  #     @group.draws.each do |draw|
  #       # draw.send_email #Take draw and send via email
  #     end
  #   end

end
