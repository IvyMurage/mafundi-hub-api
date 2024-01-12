class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = params[:user]
    mail(to: @user.email, subject: "Welcome to Mafundi Hub")
  end
end
