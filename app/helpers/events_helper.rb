require 'open-uri'

module EventsHelper

  def authenticated_event_user?
    if session[:event_id] && session[:event_id] == @event.id
      return true
    elsif current_user && (@event.user_id == current_user.id || @event.guests.collect(&:user_id).include?(current_user.id))
      return true
    elsif @event.guests.collect(&:g_id).include?(params[:g_id])
      return true
    else
      return false
    end
  end

  def allowed_to_invite?(event,user)
    return false unless user
    return true if user.id == event.user_id
    return true if event.setting && event.setting.allow_guest_to_invite_friends? &&  event.guests.collect(&:user_id).include?(user.id)
    return false
  end
  
end
