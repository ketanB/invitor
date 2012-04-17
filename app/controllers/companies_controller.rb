class CompaniesController < ApplicationController
  autocomplete :tag, :name

  layout :choose_layout
  # GET /companies
  # GET /companies.xml
  def index
    #location = GeoIp.geolocation('99.104.74.184')
    #companies = Company.within(5, :origin => [location[:latitude],location[:longitude]])
    #raise companies.inspect
    @companies = Company.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @companies }
    end
  end

  # GET /companies/1
  # GET /companies/1.xml
  def show
    @company = Company.find(params[:id])
    @reviewable = @company

    respond_to do |format|
      format.html {render :layout => 'with_search_header'}
      format.xml  { render :xml => @company }
    end
  end

  #--------------------------------MY CODE--------------------------------------#
  def list_info
    @company_info = CompaniesUserInfo.all

  end

  def dashboard
    CompaniesController.layout 'application'
    if current_user.role_id == 1
      @user_company = UserCompanies.find_by_user_id(current_user.id)

      if @user_company.nil?
        redirect_to "/"
    
        #@company_quotes = QuoteCompanies.where(:company_id => 119)
      else
        @company = Company.find(@user_company.company_id)
        @company_solicitudes_new = CompanySolicitude.where(:company_id => @company.id, :is_new => true )
        @company_solicitudes = CompanySolicitude.where(:company_id => @company.id)
        @messages = Message.where(:to => current_user.id)
        @messages_new = Message.where(:to => current_user.id, :is_new => true)
      end
  
    else
      redirect_to "/"
    end
  end

  def messages
    CompaniesController.layout 'application'

    if current_user.role_id == 1
      @user_company = UserCompanies.find_by_user_id(current_user.id)

      if @user_company.nil?
        redirect_to "/"

        #@company_quotes = QuoteCompanies.where(:company_id => 119)
      else
        @company = Company.find(@user_company.company_id)
        @company_solicitudes = CompanySolicitude.where(:company_id => @company.id)

      end

    else
      redirect_to "/"
    end

  end

  def message

    CompaniesController.layout 'application'
    
    @company_solicitude = CompanySolicitude.find(params[:id])
    @company_solicitude.update_attribute(:is_new, false)

    @responses = Message.where(:csolicitude_id => @company_solicitude.id, :parent => 0)

    @solicite = QuoteSolicitations.find(@company_solicitude.solicitude_id)

    @quote = Quote.find(@solicite.quote_id)
    @person ? @person.name : nil
    
    @message_cont ? Message.find(params[:msg]) : nil

    @message = Message.new
    
  end

  def create_message

    @message = Message.new(params[:message])
    
    respond_to do |format|
      if @message.save
        format.html { redirect_to(:action => "messages") }
        format.xml  { render :xml => @message, :status => :created }
      else
        format.html { render :action => "message"}
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
    
  end

  def create_response
    @quote_response = QuoteResponses.new(params[:quote_response])

    respond_to do |format|
      if @quote_response.save
        format.html { redirect_to(:action => "dashboard") }
        format.xml  { render :xml => @quote_response, :status => :created }
      else
        format.html { render :action => "create_response" }
        format.xml  { render :xml => @quote_response.errors, :status => :unprocessable_entity }
      end
    end
    
  end

  #--------------------------------END CODE -----------------------------------#

  # GET /companies/new
  # GET /companies/new.xml
  def new
    @company = Company.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @company }
    end
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])
    @states = State.where(:country_id => @company.country_id)
    @cities = City.where(:state_id => @company.state_id)
    @business_categories = BusinessCategory.where(:business_group_id => @company.business_group_id)
  end

  #----------------------------MY CODE-------------------#
  def edit_info
    
    CompaniesController.layout 'with_search_header'

    @company = Company.find(params[:id])
    @company_info = CompaniesUserInfo.new
    @company_info.name = @company.name
    @company_info.company_id = @company.id
    @company_info.street1 = @company.street1
    @company_info.street2 = @company.street2
    @company_info.phone = @company.phone
    @company_info.fax = @company.fax
    @company_info.country_id = @company.country_id
    #@company_info.state_id = @company.state_id
    #@company_info.state_id = 10
    #@company_info.city_id = @company.city_id
    @company_info.zip = @company.zip
    @company_info.website = @company.website
    @states = State.where(:country_id => 226)
    #@states = State.where(:country_id => @company.country_id)
    @cities = City.where(:state_id => @company.state_id)
    #@business_categories = BusinessCategory.where(:business_group_id => @company.business_group_id)
  end
  #----------------------------MY CODE-------------------#

  # POST /companies
  # POST /companies.xml
  def create
    @company = Company.new(params[:company])

    respond_to do |format|
      if @company.save
        format.html { redirect_to(@company, :notice => 'Company was successfully created.') }
        format.xml  { render :xml => @company, :status => :created, :location => @company }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @company.errors, :status => :unprocessable_entity }
      end
    end
  end



  #-------------------------MY CODE---------------------------#
  # POST /companies
  # POST /companies.xml
  def create_info

    @company_info = CompaniesUserInfo.new(params[:company_info])
    @company = Company.find(@company_info.company_id)

    if(@company_info.name == @company.name)
      @company_info.name =  nil
    end

    if(@company_info.city_id == @company.city_id)
      @company_info.city_id = nil
    end

    if(@company_info.country_id == @company.country_id)
      @company_info.country_id = nil
    end

    if(@company_info.fax == @company.fax)
      @company_info.fax = nil
    end

    if(@company_info.phone == @company.phone)
      @company_info.phone = nil
    end

    if(@company_info.state_id == @company.state_id)
      @company_info.state_id = nil
    end

    if(@company_info.street1 == @company.street1)
      @company_info.street1 = nil
    end

    if(@company_info.street2 == @company.street2)
      @company_info.street2 = nil
    end

    if(@company_info.website == @company.website)
      @company_info.website = nil
    end

    if(@company_info.zip == @company.zip)
      @company_info.zip = nil
    end


    respond_to do |format|
      if @company_info.save
        format.html { redirect_to(:action => 'show', :id => @company_info.company_id) }
        format.xml  { render :xml => @company_info}
      else
        format.html { redirect_to :action => "edit_info", :id => @company_info.company_id}
        format.xml  { render :xml => @company_info.errors, :status => :unprocessable_entity }
      end
    end
  end
  #-----------------------------------------------------------#



  # PUT /companies/1
  # PUT /companies/1.xml
  def update
    @company = Company.find(params[:id])
    params[:company][:category_ids] ||= []
    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to(@company, :notice => 'Company was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @company.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.xml
  def destroy
    @company = Company.find(params[:id])
    @company.destroy

    respond_to do |format|
      format.html { redirect_to(companies_url) }
      format.xml  { head :ok }
    end
  end

  #------------------------------------Mi Code---------------------------#
  def destory_info
    @company_info = CompaniesUserInfo.find(params[:id])
    @company_info.destroy

    respond_to do |format|
      format.html { redirect_to(:action => "list_info") }
      format.xml  { head :ok }
    end
  end
  #----------------------------------------------------------------------#
  

  def load_cities
    @cities = City.where(:state_id => params[:state_id]).all
  end

  def load_states
    @states = State.where(:country_id => params[:country_id]).all
  end

  def load_business_categories
    @company = Company.find(params[:company_id]) rescue Company.new
    @business_categories = BusinessCategory.where(:business_group_id => params[:business_group_id]).all
  end

  def delete_photo
    asset = CompanyAsset.find(params[:photo_id])
    asset.destroy
    render :nothing => true
  end

  def autocomplete_tags2

     #@companies = Company.where(:business_group_id => 1)
    # items = @companies.find_tagged_with(params[:term])
    
    items = Tag.find(:all)
    
    #items = Tag.where("name like('%#{params[:term]}%')").limit(15)
    render :json => json_for_autocomplete(items, :name)
  end

  def autocomplete_tags
    items = Tag.where("name like('%#{params[:term]}%')").limit(15)
    render :json => json_for_autocomplete(items, :name)
  end

  def search
    @companies = Company.ts_search(params)
    @cities = Company.ts_search_cities(params)
    @map = initialize_map(@companies)
    render :layout => 'with_search_header'
  end

  def remote_search
    @companies = Company.ts_search(params)
    @cities = Company.ts_search_cities(params)
    @map = initialize_map(@companies)
    render :partial => "search_content"
  end
  
  def photos
    @company = Company.where(:id => params[:id]).includes(:assets).first
    if params[:next]
      @main_image = @company.assets.find(:first, :conditions => ['id > ?',params[:photo].to_i])
      unless @main_image
        @main_image = @company.assets.first
      end
    elsif params[:prev]
      @main_image = @company.assets.find(:first, :conditions => ['id < ?',params[:photo].to_i])
      unless @main_image
        @main_image = @company.assets.last
      end
    else
      @main_image = CompanyAsset.find(params[:photo]) rescue nil
      unless @main_image
        @main_image = @company.assets.first
      end
    end
  end

  def company_location
    company = Company.find(params[:id])
    render :partial => "company_location", :locals => {:company => company}
  end

  private

  def choose_layout
    ['show', 'search', 'photos'].include?(action_name) ? 'with_search_header' : 'admin'
  end

  def initialize_map(companies)
    map = Cartographer::Gmap.new('map')
    map.marker_clusterer = true
    map.marker_mgr = true
    map.center = center(companies)
    map.zoom = 4
    set_markers(map, companies)
    return map
  end

  def set_markers(map, companies)
    icon_org = Cartographer::Gicon.new()
    map.icons <<  icon_org
    companies.each do |company|
      if company.latitude && company.longitude
        marker = Cartographer::Gmarker.new(
          :name=> "org#{company.id}", :marker_type => "Organization",
          :position => [company.latitude,company.longitude],
          :info_window_url => url_for(:action => :company_location, :id => company.id),
          :icon => icon_org)
        map.markers << marker
      end
    end
  end

  def center(companies)  
    center = [37.09024, -95.712891]#Set default center on US
    if companies.size > 0
      lats = []
      lngs = []
      companies.each do |company|
        if company.latitude && company.longitude
          lats << company.latitude
          lngs << company.longitude
        end
      end
      center = [lats.instance_eval{reduce(:+)/size.to_f}, lngs.instance_eval{reduce(:+)/size.to_f}] unless lats.empty?
    end
    return center
  end

end
