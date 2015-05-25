class AdminMailer < ActionMailer::Base
  default from: "noreply@website.com"
  default to: "agsilver85@gmail.com"
  

    
  def new_user(user)
    @user = user
    mail(subject: "New User: #{user.email}")
  end
end