class UserMailer < ApplicationMailer
  default from: 'donotreply@flatirionschool.com'

  def welcome_email
    @user = params[:user]
    @url  = 'http//localhost:3000/login'
    mail(to: @user.email, subject: 'Welcome to Flatiron Secret Santa')
  end

end
