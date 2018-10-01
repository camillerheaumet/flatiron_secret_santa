class WelcomeController < ApplicationController
  before_action :require_login

  def home
  end

  def new
    @group = Group.new
  end

  def create
    
  end


end
