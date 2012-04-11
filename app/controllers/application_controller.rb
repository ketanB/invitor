class ApplicationController < ActionController::Base
  #  protect_from_forgery
  layout 'application'
  
  config.filter_parameters :password, :password_confirmation
  helper_method :current_user, :logged_in?,:admin?,:facebook_session

  before_filter :set_facebook_session, :set_language, :load_defaults


  def call_rake(task, options = {})
    options[:rails_env] ||= Rails.env
    args = options.map { |n, v| "#{n.to_s.upcase}='#{v}'" }
    system "/usr/bin/rake #{task} #{args.join(' ')} --trace 2>&1 >> #{Rails.root}/log/rake.log &"
  end



  def update_event_from_session
    return unless current_user
    if session[:event_id]
      @event = Event.find(session[:event_id]) rescue nil
      @event.update_attribute(:user_id, current_user.id) if @event
      session[:event_id] = nil
    end

    if session[:guest_id]
      @guest = Guest.find(session[:guest_id]) rescue nil
      @guest.update_attribute(:user_id, current_user.id) if @guest
      session[:guest_id] = nil
    end

    if session[:g_id]
      @guest = Guest.find_by_g_id(session[:g_id]) rescue nil
      @guest.update_attribute(:user_id, current_user.id) if @guest
      event = Event.find(session[:invite_guest_event_id]) unless session[:invite_guest_event_id].nil?
      session[:g_id] = nil
      if event
        session[:invite_guest_event_id] = nil
        @redirect_path = launch_event_path(event)
      end
    end

    if session[:launch_event_id]
      success =  Event.launch(session[:launch_event_id], current_user.full_name)
      event = session[:launch_event_id]
      session[:launch_event_id] = nil

      @redirect_path = launch_event_path(event)
    end

  end


  
  private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def logged_in?
    current_user.nil? ? false : true
  end

  def admin?
    current_user && current_user.role && current_user.role.name == 'admin' ? true : false
  end

  def require_user
    unless current_user
      session_and_message
      redirect_to new_user_session_url
      return false
    end
  end

  def require_admin_user
    unless current_user and current_user.is_admin
      session_and_message
      redirect_to admin_login_url
      return false
    end
  end

  def session_and_message
    store_location
    flash[:error] = "You must be logged in to access this page"
  end

  def require_no_user
    if current_user
      store_location
      flash[:error] = "You must be logged out to access this page"
      redirect_to home_url
      return false
    end
  end

  def store_location
    session[:return_to] = request.request_uri
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  #set language on app default language is english.
  def set_language
    I18n.locale = session[:language] || I18n.default_locale
    
  end

  def load_defaults
    @default_country_id = 226
  end

  def login_from_fb
    if facebook_session
      self.current_user = User.find_by_fb_user(facebook_session.user)
    end
  end

  
  
end
