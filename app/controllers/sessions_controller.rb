class SessionsController < ApplicationController


  def new
    #add a field, if user has invitation pending, display link to controller: group, action: "acceptance"
  end

  def create
    user = User.find_by(name: params[:user][:name])
    authenticated = user.try(:authenticate, params[:user][:password])
    return redirect_to root_path unless authenticated
    @user = user
    session[:user_id] = @user.id
    redirect_to controller: 'users', action: 'show'
  end

  # def create
  #   @user = User.find_by(name: params[:user][:name])
  #   return head(:forbidden) unless @user.authenticate(params[:user][:password])
  #   session[:user_id] = @user.id
  #   redirect_to @user
  # end


  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  private

  def session_params
    params.require(:user).permit(:name, :password)
  end


end
