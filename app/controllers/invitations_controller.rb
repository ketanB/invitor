class InvitationsController < ApplicationController

  def status
    @guests = initialize_grid(Guest, :include=>[:contact], :conditions=>["event_id=?", params[:id]])
    @guests_count = Guest.count :all, :group=>"response", :conditions=>["event_id=?", params[:id]]
    redirect_to :back and return false if @guests.blank?    
  end

  def track_open_rate
    Guest.update(params[:id], :email_viewed=>1, :email_viewed_at=>Time.now)
    render :text=>"done", :layout=>false and return false
  end


  # GET /invitations
  # GET /invitations.xml
  def index
    @invitations = Invitation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @invitations }
    end
  end

  # GET /invitations/1
  # GET /invitations/1.xml
  def show
    @invitation = Invitation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @invitation }
    end
  end

  # GET /invitations/new
  # GET /invitations/new.xml
  def new
    @invitation = Invitation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @invitation }
    end
  end

  # GET /invitations/1/edit
  def edit
    @invitation = Invitation.find(params[:id])
  end

  # POST /invitations
  # POST /invitations.xml
  def create
    @invitation = Invitation.new(params[:invitation])

    respond_to do |format|
      if @invitation.save
        format.html { redirect_to(@invitation, :notice => 'Invitation was successfully created.') }
        format.xml  { render :xml => @invitation, :status => :created, :location => @invitation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @invitation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /invitations/1
  # PUT /invitations/1.xml
  def update
    @invitation = Invitation.find(params[:id])

    respond_to do |format|
      if @invitation.update_attributes(params[:invitation])
        format.html { redirect_to(@invitation, :notice => 'Invitation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @invitation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /invitations/1
  # DELETE /invitations/1.xml
  def destroy
    @invitation = Invitation.find(params[:id])
    @invitation.destroy

    respond_to do |format|
      format.html { redirect_to(invitations_url) }
      format.xml  { head :ok }
    end
  end

  def guests_invite
    event = Event.find_by_id(params[:event_id])
    guest = Guest.find_by_g_id(params[:guest_g_id])

    guests = []

    params[:email].each_with_index do |email, k|
      c_email = email[1].scan(/[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i).first
      contact = Contact.find_by_email(c_email)
      contact = Contact.create(:email => c_email)
      new_guest = Guest.find_by_event_id_and_contact_id(event.id, contact.id)
      new_guest = Guest.create(:event_id => event.id, :invited_by_guest_g_id => guest.g_id,:language=> params[:rbtn][k], :contact_id=> contact.id, :g_id=> rand(36**16).to_s(36)) if new_guest.blank?
      guests << new_guest
    end
    
    guests.each do |g|
      Mailer.send_invitation(g,event, guest.name).deliver
      g.update_attributes(:invited=> true, :invited_at=>Time.now)
    end

    flash[:notice] ||=  'Guests are invited'
    redirect_to :back and return
  end
end
