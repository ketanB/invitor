class EventsController < ApplicationController
  include EventsHelper
  before_filter :require_user, :only => [:index]
  before_filter :prepare_language, :only => [:new_step_3, :new_step_4, :invite_guests]
  

  uses_tiny_mce :options => {
    :width => '400px',
    :height => '200px'
  }

  
  # GET /events
  # GET /events.xml
  def index
    @events = Event.where(['(events.user_id= ? OR guests.user_id = ?)', current_user.id,  current_user.id])
    #@events = @events.where(['date >= ?', Date.today])
    @events = @events.includes([:guests, :setting])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id], :include => :guests)
    @setting = @event.setting ? @event.setting : EventSetting.new
    if current_user_can_view?
      if current_user
        @guest = Guest.find(:first, :conditions => {:user_id =>current_user.id, :event_id => @event.id}) rescue nil       
        if !@guest
          guest_id = params[:g_id] || session[:guest_id]
          @guest = Guest.first( :conditions => ['event_id = ? AND (id = ? OR g_id = ? )',@event.id,guest_id,guest_id ]) rescue nil
          if @guest
            @guest.update_attribute(:user_id, current_user.id)
          end
        end
      else
        @guest = Guest.where(["(id = ? OR g_id = ?) AND event_id = ?",params[:g_id],params[:g_id], @event.id]).first rescue nil
      end

    else
      flash[:notice] = "You are not allowed to view "
      redirect_to root_path
      return
    end
   render :layout => 'only_content'
  end

  # GET /events/new
  # GET /events/new.xml
  def new
    @event = Event.new
    @categories = Category.all :conditions=>"country_id=226" #for default americans categories
    @countries = Country.includes(:translations).order('country_translations.name')

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end


  def new_step_2    
    unless session[:event_id]
      @event = Event.new(params[:event])
      @event.save(false)
      session[:event_id] = @event.id
    else
      @event = Event.find(session[:event_id])
      @event.update_attributes(params[:event])
    end
    
    @event_setting = @event.setting ? @event.setting : @event.build_setting
    if @event.errors.empty?
      @event.save_design(params) if params[:skip_step1].blank?
      session[:event_id] = @event.id
      flash[:notice] = "Now enter the details for the event"
    else
      render :action => 'new'
    end
  end

  def update_event_data
    if params[:en] && !params[:en][:name].blank?
      I18n.locale = 'en'
      @event.update_attributes(params[:en])
    end
    if params[:es] && !params[:es][:name].blank?
      I18n.locale = 'es'
      @event.update_attributes(params[:es])
    end
    if @event.setting
      @event.setting.update_attributes(params[:settings])
    elsif params[:settings]
      EventSetting.create(params[:settings].merge(:event_id => @event.id))
    end

    if @event.setting && @event.setting.event_reminder? && @event.date
      @event.update_attribute(:reminder_date, @event.date - @event.setting.reminder_days.days)
    else
       @event.update_attribute(:reminder_date, nil)
    end
  end

  def new_step_3
    #session[:event_id] = nil
    unless session[:event_id]
      @event = Event.new(params[:event])
      @event.save(false)
      session[:event_id] = @event.id
    else
      @event = Event.find(session[:event_id])
      @event.update_attributes(params[:event])
    end
    update_event_data
    if @event.errors.empty?
      flash[:notice] = "Now add guest for the event"
    else
      render :action => 'new_step_2'
    end
  end

  #add guest to event
  def new_step_4
    
    #@event = Event.find(session[:event_id])
    unless session[:event_id]
      redirect_to new_step_1_path
      return
    else
      @event = Event.find(session[:event_id], :include => :guests)
      unless session[:guest_id]
        @guest = Guest.create(:event_id=> @event.id,:g_id => rand(36**16).to_s(36), :event_host => true )
        session[:guest_id] = @guest.id
      else
        @guest = Guest.find(session[:guest_id], :conditions => {:event_id => @event.id}) rescue nil
      end
    end
    @setting = @event.setting ? @event.setting : EventSetting.new
    begin
      @event.add_guest_to_invitation(params) if params[:skip_step3].blank?

      flash[:notice] = "Now preview invitation"
    rescue
      render :action => 'new_step_3'
    end
  end

  # POST /events
  # POST /events.xml
  def create
    @event = Event.find(session[:event_id])

    respond_to do |format|
      #      if @event.send_invitation_to_guests
      if @event #.send_invitation_to_guests
        format.html { redirect_to(@event, :notice => 'Event was successfully created.') }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new_step_4" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    @event_setting = @event.setting ? @event.setting : @event.build_setting
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        update_event_data
        format.html { redirect_to(@event, :notice => 'Event was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(events_url) }
      format.xml  { head :ok }
    end
  end

  def invite_guests
    unless current_user
      session[:g_id] = params[:g_id]
      session[:invite_guest_event_id] = params[:id]
      redirect_to login_path
      return
    end
    event = Event.find(params[:id])

    unless allowed_to_invite?(event, current_user)
      flash[:notice] = "You are not allowed to invite "
      redirect_to event_path(event)
      return
    end

    guests = []
    max_guest = event.setting.max_guests_num.to_i if event.setting.max_guests? && event.setting.max_guests_num.to_i >= 0

    params[:contact_id].each do |k,contact_id|
      if max_guest && event.guests.count >= max_guest
        flash[:notice] = 'Guests limit exceeded'
        break
      end
      guests << Guest.create(:event_id => params[:id], :invited_by => current_user.id,:contact_id=> contact_id, :language=> params[:rbtn][k], :g_id=> rand(36**16).to_s(36))
    end
    
    guests.each do |guest|
      Mailer.send_invitation(guest,event, current_user.full_name).deliver
      guest.update_attributes(:invited=> true, :invited_at=>Time.now)
    end
    flash[:notice] ||=  'Guests are invited'
    redirect_to event
  end

  def guest_list
    @event = Event.find(params[:id])
  end

  def message
    @event = Event.find(params[:id])
  end

  def media
    @event = Event.find(params[:id])
  end

  def customize
    @event = Event.find(params[:id])
    @design = @event.design
  end

  def comment
    @event = Event.find(params[:id])

    @event.comments.create({:user_id => current_user.id, :comment => params[:comment]})
    redirect_to :back
  end

  #load category by country
  def country_changed
    @categories = Category.all :conditions=>["country_id=?", params[:id]]
    respond_to do |format|
      format.js
    end
  end

  #load themes by category
  def category_changed
    @themes = Theme.by_category_and_country(params[:category_id], params[:country_id])
    respond_to do |format|
      format.js
    end
  end

  def upload_fg_image
    @fg_image = FgUpload.new(params[:fg_image])
    if@fg_image.save
      @user_fg_images = []
      @user_fg_images << @fg_image
      render :partial => 'user_fg_image', :collection =>  @user_fg_images
    else
      render :nothing => true
    end
  end

  def upload_bg_image
    @bg_image = FgUpload.new(params[:bg_image])
    if@bg_image.save
      @user_bg_images = []
      @user_bg_images << @bg_image
      render :partial => 'user_bg_image', :collection =>  @user_bg_images
    else
      render :nothing => true
    end
  end

  def import_contacts
    @contacts = []
    if params[:from] == "csv"
      temp_file = "#{RAILS_ROOT}/tmp/#{Time.now.to_i.to_s}.csv"
      f = open(temp_file,"w")
      f.write(params[:csv].read)
      f.close
      @contacts = Blackbook.get :csv,:file => open(temp_file)
    else
      case params[:from]
      when "gmail"
        @contacts = Contacts::Gmail.new(params[:login],params[:password]).contacts
      when "yahoo"
        @contacts = Contacts::Yahoo.new(params[:login],params[:password]).contacts
      when "hotmail"
        @contacts = Contacts::Hotmail.new(params[:login],params[:password]).contacts
      when "aol"
        @contacts = Contacts::Aol.new(params[:login],params[:password]).contacts
      when "outlook"
        @contacts = Contacts::Outlook.new(params[:login],params[:password]).contacts
      when "facebook"
        @contacts = Contacts::Facebook.new(params[:login],params[:password]).contacts
      end
    end
    # raise @contacts.inspect
    respond_to do |format|
      format.js
    end
  end

  def guest_response
    @event = Event.find(params[:id])
    @guest = Guest.find_by_g_id(params[:g_id], :conditions => {:event_id => @event.id})
    @guest.update_attributes(params[:guest])
    @setting = @event.setting ? @event.setting : EventSetting.new
    respond_to do |format|
      format.js
    end
  end

  #send response from email
  def update_response
    #begin
    @event = Event.find(params[:id])
    @setting = @event.setting ? @event.setting : EventSetting.new
    @guest = Guest.first(:conditions => ['event_id = ? AND (id = ? OR g_id = ?)',@event.id, params[:g_id], params[:g_id]])

    if @setting && @setting.allow_guest_maybe? &&  params[:g_response].to_i == 2
      redirect_to event_path(@event, :g_id=> params[:g_id] ), :notice=> 'Maybe RSVP not allowed'
      return false
    end

    @guest.update_attribute(:response, params[:g_response])
    redirect_to event_path(@event, :g_id=> params[:g_id] )
    #rescue
    #  redirect_to root_path
    #else

    #end
  end


  def render_guests
    @event = Event.find(params[:id])
    @guests = @event.classified_guests
    
    respond_to do |format|
      format.js
    end
  end
  

  def launch
    unless current_user
      session[:launch_event_id] = params[:id]
      redirect_to new_user_session_url
      return false
    else
      @event = Event.find(params[:id])
      if session[:event_id]
        @event.update_attribute(:user_id, current_user.id) 
        session[:event_id] = nil
      end

      if session[:guest_id]
        @guest = Guest.find(session[:guest_id]) rescue nil
        @guest.update_attribute(:user_id, current_user.id) if @guest
        session[:guest_id] = nil
      end
      
      Event.launch(@event.id, current_user.full_name)
      redirect_to event_path(@event)
    end
    
  end

  def unsubscribe
    @event = Event.find(params[:id])
    @guest = Guest.find_by_g_id(params[:g_id]) rescue nil
    if @guest
      @guest.destroy
      flash[:notice] = 'Unsubscribed successfully'
    end
    redirect_to root_path
  end

  def upload_photo
    @event_photo = EventAsset.new(params[:event])
    @event_photo.uploaded_by = current_user.id if current_user
    if@event_photo.save
      
      render :partial => 'photo', :object =>  @event_photo
    else
      render :nothing => true
    end
  end

  def upload_video
    event = Event.find_by_id(params[:event_id])
    Video.create(:event_id=>event.id, :embed_path=>params[:embed_video_path])
    redirect_to :back and return false
  end

  def thumb_photos
    event = Event.find(params[:id], :include=> :assets)
    render :update do |page|
      page << "$('#event_photos').html('#{escape_javascript(render :partial =>'photo', :collection => event.assets)}');"
    end
  end

  def photos
    @event = Event.where(:id => params[:id]).includes(:assets).first
    if params[:next]
      @main_image = @event.assets.find(:first, :conditions => ['id > ?',params[:photo].to_i])
      unless @main_image
        @main_image = @event.assets.first
      end
    elsif params[:prev]
      @main_image = @event.assets.find(:first, :conditions => ['id < ?',params[:photo].to_i])
      unless @main_image
        @main_image = @event.assets.last
      end
    else
      @main_image = EventAsset.find(params[:photo]) rescue nil
      unless @main_image
        @main_image = @event.assets.first
      end
    end
  end

  private
  def prepare_variables
    
  end

  def prepare_language
    @languages = Language.all.collect{|v|[v.name, v.id]}
  end

  def current_user_can_view?
    return true if @setting.public_event?
    user_ids = @event.guests.collect(&:user_id).compact
    g_ids = @event.guests.collect(&:g_id).compact
    return true if current_user && user_ids.include?(current_user.id)
    return true if g_ids.include?(params[:g_id])
    return false
  end
end
