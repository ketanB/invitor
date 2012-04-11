class Mailer < ActionMailer::Base

  def password_reset_instructions(user)
    @subject    = "Password Reset Instructions"
    @from       = "Invitar Notifier <lorem.ipsume@gmail.com>"
    @recipients = user.email
    @sent_on    = Time.now
    @body       = {:edit_password_reset_url => edit_password_reset_url(user.perishable_token)}
  end

  def send_invitation(guest, event, invited_by)    
    if guest.language == 'en'
      @subject    = "You are invited to #{event.name}"
    else
      @subject    = "You are invited to #{event.name}"
    end
    @event=event
    @guest = guest
    @invited_by= invited_by
    @tracking_link = "/invitation/track_open_rate/" + guest.id.to_s
    mail(:to => "#{guest.contact.full_name} <#{guest.contact.email}>", :subject => @subject, :from => "#{event.hosted_by} <cst@invitar.com>")
  end

  def event_reminder(guest, event)
    if Date.today + 1.day == event.date
      event_date = 'tomorrow'
    else
      event_date = "on #{event.date}"
    end
    if guest.language == 'en'
      @subject    = "#{event.name} is  #{event_date}"
    else
      @subject    = "#{event.name} is  #{event_date}"
    end
    @event=event
    @guest = guest
    @invited_by= event.hosted_by
    @event_date = event_date
    mail(:to => "#{guest.contact.full_name} <#{guest.contact.email}>", :subject => @subject, :from => "#{event.hosted_by} <cst@invitar.com>")
  end

 
end
