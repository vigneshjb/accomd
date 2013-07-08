class UserMailer < ActionMailer::Base
  default from: "from@gmail.com"

  def welcome_email
    mail(:to => "vigneshj@freshdesk.com", :subject => "Welcome to My Awesome Site")
  end
end
