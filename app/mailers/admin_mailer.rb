class AdminMailer < ActionMailer::Base
  default from: "noreply@website.com"
  default to: "agsilver85@gmail.com"
  
  def mandrill_client
    @mandrill_client ||= Mandrill::API.new MANDRILL_API_KEY
  end
    
  def new_user(user)
    @user = user
    mail(to: @user.email, subject: "New User: #{user.email}")
  end
  
  
  # Sends updates for new listing items
  #The problem is that you have to use rails console to first identify the listing you want to "advertise" in an email then send that listing using Admin Mailer
  #rails c code follows:
  # listing = Listing.first
  # AdminMailer.new_listing(listing)
  # result should be something like
  # => #<ActionMailer::Base::NullMail:etc....>
    def new_listing(listing)
    template_name = "new-listing"
    template_content = []
    message = {
      to: [{email: "agsilver85@gmail.com"}],
      subject: "New listing: #{listing.name}",
      merge_vars: [
        {rcpt: "agsilver85@gmail.com",
          vars: [
            {name: "LISTING_NAME", content: listing.name}
           ]
          }
        ]
      }
      mandrill_client.messages.send_template template_name, template_content, message
  end
end