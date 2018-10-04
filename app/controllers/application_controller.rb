class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :current_user
  helper_method :current_user
  helper_method :logged_in?

  def current_user
      @user = (User.find_by(id: session[:user_id]) || User.new)
  end

  def logged_in?
    session[:user_id]
  end

  def require_login
    redirect_to controller: 'sessions', action: 'new' unless logged_in?
  end

end
