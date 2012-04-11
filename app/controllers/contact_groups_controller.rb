class ContactGroupsController < ApplicationController
  respond_to :js, :only => [:create,:destroy]
  # GET /contact_groups
  # GET /contact_groups.xml
  def index
    @contact_groups = ContactGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contact_groups }
    end
  end

  # GET /contact_groups/1
  # GET /contact_groups/1.xml
  def show
    @contact_group = ContactGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contact_group }
    end
  end

  # GET /contact_groups/new
  # GET /contact_groups/new.xml
  def new
    @contact_group = ContactGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contact_group }
    end
  end

  # GET /contact_groups/1/edit
  def edit
    @contact_group = ContactGroup.find(params[:id])
  end

  # POST /contact_groups
  # POST /contact_groups.xml
  def create
    @contact_group = ContactGroup.new(params[:contact_group])
    @contact_group.user_id = current_user.id
    @contact_group.save
  end

  # PUT /contact_groups/1
  # PUT /contact_groups/1.xml
  def update
    @contact_group = ContactGroup.find(params[:id])

    respond_to do |format|
      if @contact_group.update_attributes(params[:contact_group])
        format.html { redirect_to(@contact_group, :notice => 'Contact group was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contact_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_groups/1
  # DELETE /contact_groups/1.xml
  def destroy
    @contact_group = ContactGroup.find(params[:id])
    @contact_group.destroy

    respond_to do |format|
      format.html { redirect_to(contact_groups_url) }
      format.xml  { head :ok }
    end
  end

  def add_contatcs
    @contact_group = ContactGroup.find_by_id(params[:id])    
    params[:recipients].split(",").each do |email|
      email = email.scan(/[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i).first

      contact = Contact.find_by_email(email)
      contact = Contact.create(:email => email) if contact.blank?
      @contact_group.contacts << contact
    end
    redirect_to contacts_user_path(:id=>params[:id], :event_id=>params[:event_id]) and return false
  end
end
