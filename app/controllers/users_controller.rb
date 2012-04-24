class UsersController < ApplicationController
  #  layout :choose_layout
  respond_to :js, :only => [:contacts_new, :contact_by_group, :edit_contact, :update_contact, :destroy_contact, :change_guest_name]
  
  ## Facebook Connect

  def facebook_login
    if current_user.nil?
      #register with fb
      User.create_from_fb_connect(facebook_session.user)
    else
      #connect accounts
      current_user.link_fb_connect(facebook_session.user.id) unless current_user.facebook_uid == facebook_session.user.id
    end
    redirect_to root_url
  end
  
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
    @user.role_id = Role.find_by_name("user").id
    
    respond_to do |format|
      if @user.save
        update_event_from_session
        if(@redirect_path)
          redirect_to @redirect_path
          return false
        end
        format.html { redirect_to dashboard_path }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end

  def contacts
    @user = current_user
    @contact_groups = ContactGroup.where(:user_id=> @user.id).includes(:translations)
    @event = Event.find(params[:event_id]) rescue nil
  end

  def contacts_new
    unless params[:email_addresses].blank?
      current_user.add_contacts(params)
    else
      @contact = Contact.new(params[:contact])
      @contact.user_id = current_user.id
      @contact.save
    end
    
  end

  def contact_by_group
    @contacts = Contact.where(:contact_group_id => params[:group_id])
  end


  def contacts_show
    @contact = Contact.find(params[:id])
  end

  def edit_contact
    @contact = Contact.find(params[:contact_id])
    @contact_groups = ContactGroup.where(:user_id=> current_user.id).includes(:translations)
  end

  def update_contact
    @contact = Contact.find(params[:contact][:id])
    ContactGroup.decrement_counter(:contacts_count 	, @contact.contact_group_id)

    @contact.update_attributes(params[:contact])
    ContactGroup.increment_counter(:contacts_count 	, @contact.contact_group_id)
    @contacts = Contact.where(:contact_group_id=> params[:contact][:contact_group_id])
  end


  def destroy_contact
    contact_ids = params[:contact_ids].split(',')
    @contacts = Contact.where(:contact_group_id=> Contact.find(contact_ids[0]).contact_group_id)
    contact_ids.each do |contact_id|
      begin
        Contact.find(contact_id).destroy
      rescue

      end
    end
    
  end

  def destroy_contact_group
    group_ids = params[:contact_group_ids].split(',')
    
    group_ids.each do |group_id|
      begin
        ContactGroup.find(group_id).destroy
      rescue

      end
    end

  end

  def dashboard
    UsersController.layout 'with_search_header'
    @quotes = Quote.where(:user_id => current_user.id)
    @events = Event.where(:user_id => current_user.id)
    @messages = Message.where(:to => current_user.id, :parent => 0 )
    @company_solicitude ? CompanySolicitude.find(@messages.first.id) : nil
    @messages_new = Message.where(:to => current_user.id, :is_new => true )
    @quote_confirm = QuoteConfirm.where(:user_id => current_user.id)
  end

  def quote
    UsersController.layout 'application'
    @message = Message.find(params[:id])
    @message.update_attribute(:is_new, false)
    @company_solicitude = CompanySolicitude.find(@message.csolicitude_id)
    @solicitude = QuoteSolicitations.find(@company_solicitude.solicitude_id)
    @quote = Quote.find(@solicitude.quote_id)
    @event = Event.find(@quote.id_event)
    @user_company = UserCompanies.where(:user_id => @message.from).first
    @company = Company.find(@user_company.company_id)

    @new_message = Message.new

  end

  def quote_view

    @solicitude = QuoteSolicitations.find(params[:id])
    @quote = Quote.find(@solicitude.quote_id)
    @event = Event.find(@quote.id_event)
    @company_solicitation = CompanySolicitude.where(:solicitude_id => @solicitude.id)
    
    
  end

  def quote_confirm

    @company_solicitude = CompanySolicitude.find(params[:id])
    @solicitude = QuoteSolicitations.find(@company_solicitude.solicitude_id)
    @quote = Quote.find(@solicitude.quote_id)
    @user_company = UserCompanies.where(:company_id => @company_solicitude.company_id).first
    @company = Company.find(@user_company.company_id)
    @event = Event.find(@quote.id_event)

    @quote_confirm = QuoteConfirm.new
  end

  def confirm_quote

    quote_confirm = QuoteConfirm.new(params[:quote_confirm])
    
    if (quote_confirm.save)

      company_solicitude = CompanySolicitude.find(params[:id])

      
      del_company_solicitude = CompanySolicitude.find(:all, :conditions => ["solicitude_id = ? ", company_solicitude.company_id])
      
      del_company_solicitude.each do |d|
        d.destroy
      end

      solicitude = QuoteSolicitations.find(company_solicitude.solicitude_id)
      solicitude.destroy

      # user_company = UserCompanies.where(:company_id => company_solicitude.company_id).first

      #del_messages = Message.where(:csolicitude_id => company_solicitude.id,
      #     :conditions => ["from != ?", user_company.user_id]).dest
      
      # del_messages.each do |m|
      #   m.destroy
      # end


      redirect_to ("/dashboard")

    end


  end

  def create_message

    @message = Message.new(params[:new_message])

    respond_to do |format|
      if @message.save
        format.html { redirect_to "/dashboard" }
        format.xml  { render :xml => @message, :status => :created }
      else
        format.html { redirect_to "dashboard/quotes"}
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end

  end

  def add_company_contacts

    
    
  end

  

  #----------------------MY CODE---------------------------------------#
  def my_quotes

    @messages = Message.where(:to => current_user.id, :parent => 0)
    @quotes = Quote.where(:user_id => current_user.id)
    
  end
  #--------------------------------------------------------------------#

  def change_guest_name
    guest = Guest.first(:conditions=>['id= ? OR g_id = ?',params[:guest][:g_id], params[:guest][:g_id]])
    if guest
      if guest.contact
        guest.contact.update_attributes(:full_name => "#{params[:firstname]} #{params[:lastname]}")
      else
        
        if current_user
          @contact  = Contact.find_or_create_by_user_id(current_user.id)
          @contact.email = current_user.email
          @contact.full_name = "#{params[:firstname]} #{params[:lastname]}"
        else
          @contact = Contact.new(:full_name => "#{params[:firstname]} #{params[:lastname]}")
        end
        @contact.save
        guest.update_attribute(:contact_id, @contact.id)
      end
      @name = guest.name
    else
      @name = ''
    end
    @name = 'Your Name' if @name.gsub(' ','') == ''
  end
  
  protected
  def choose_layout
    layout_name =  [:new, :edit].include?(action_name.to_sym) ? 'account' : 'application'
    layout_name = 'admin' if action_name == 'index'
    layout_name
    'application'
  end

end
