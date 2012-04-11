desc "Send Event reminder"


task(:send_event_reminder => :environment) do |t, args|
#  date = args[:e_date] || Date.today
#  events = Event.all(:conditions=> ['reminder_date >= ? AND date > ?', date, date])

  events = Event.all(:conditions=>["reminder_date =? ", Date.today])
  events.each do |event|
    event.send_reminder
  end
end