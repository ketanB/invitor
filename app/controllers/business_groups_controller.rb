class BusinessGroupsController < ApplicationController
  layout 'admin'
  # GET /business_groups
  # GET /business_groups.xml
  def index
    @business_groups = BusinessGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @business_groups }
    end
  end

  # GET /business_groups/1
  # GET /business_groups/1.xml
  def show
    @business_group = BusinessGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @business_group }
    end
  end

  # GET /business_groups/new
  # GET /business_groups/new.xml
  def new
    @business_group = BusinessGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @business_group }
    end
  end

  # GET /business_groups/1/edit
  def edit
    @business_group = BusinessGroup.find(params[:id])
  end

  # POST /business_groups
  # POST /business_groups.xml
  def create
    @business_group = BusinessGroup.new(params[:business_group])

    respond_to do |format|
      if @business_group.save
        format.html { redirect_to(@business_group, :notice => 'Business group was successfully created.') }
        format.xml  { render :xml => @business_group, :status => :created, :location => @business_group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @business_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /business_groups/1
  # PUT /business_groups/1.xml
  def update
    @business_group = BusinessGroup.find(params[:id])

    respond_to do |format|
      if @business_group.update_attributes(params[:business_group])
        format.html { redirect_to(@business_group, :notice => 'Business group was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @business_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /business_groups/1
  # DELETE /business_groups/1.xml
  def destroy
    @business_group = BusinessGroup.find(params[:id])
    @business_group.destroy

    respond_to do |format|
      format.html { redirect_to(business_groups_url) }
      format.xml  { head :ok }
    end
  end
#----------------------------MY CODE --------------------------------#
  def list

    BusinessGroupsController.layout 'with_search_header'
   
    @business_groups_12 = BusinessGroup.includes([:translations]).where(:active => true).order('business_group_translations.title ASC').first(12)
    @business_groups = BusinessGroup.includes([:translations]).where(:active => true).order('business_group_translations.title ASC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @business_groups }
    end

  end

  def detail

    BusinessGroupsController.layout 'with_search_header'

    @business_group = BusinessGroup.find(params[:id])
    @business_groups = BusinessGroup.includes([:translations]).where(:active => true).order('business_group_translations.title ASC')

  end
#-------------------------------------------------------------------#
end
