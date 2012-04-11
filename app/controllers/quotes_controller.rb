class QuotesController < ApplicationController
  layout 'with_search_header'
  # GET /quotes
  # GET /quotes.xml
  def index
    @quotes = Quote.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @quotes }
    end
  end

  def load_cities
    @cities = City.where(:state_id => params[:state_id]).all
  end
  
  # GET /quotes/1
  # GET /quotes/1.xml
  def show
    @quote = Quote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @quote }
    end
  end

  # GET /quotes/new
  # GET /quotes/new.xml
  def new
    if logged_in?
    @quote = Quote.new
    @event = Event.where(:user_id => current_user.id).all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @quote }
    end
    else
      redirect_back_or_default("/login")
    end
  end

  # GET /quotes/1/edit
  def edit
    @quote = Quote.find(params[:id])
  end

  def quote_response
    @company_quote = QuoteCompanies.find(params[:id])
    @quote = Quote.find(@company_quote.quote_id)
    @state = State.find(@quote.state_id)
    @city = City.find(@quote.city_id)
    @quote_response = QuoteResponses.new
  end

  # POST /quotes
  # POST /quotes.xml
  def create
    @quote = Quote.new(params[:quote])
    @quote.city_id = params[:company][:city_id]
    
    

    respond_to do |format|
      if @quote.save
        create_solicitations(@quote.id, params[:tags_name])
        format.html { redirect_to(@quote, :notice => 'Quote was successfully created.') }
        format.xml  { render :xml => @quote, :status => :created, :location => @quote }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @quote.errors, :status => :unprocessable_entity }
      end
    end
  end

  #-------------------------------My Code-------------------------#
  def create_solicitations(quote_id, solicitudes)

    @quote = Quote.find(quote_id)

    solicitudes.each do |solicitud|

      @obj = QuoteSolicitations.new
      @obj.quote_id = @quote.id
      @obj.solicitude = solicitud
      @obj.save
      

      @companies = Company.find_by_sql("SELECT DISTINCT (companies.id) FROM companies_categories
      INNER JOIN  business_category_translations  ON ( companies_categories.business_category_id =  business_category_translations.business_category_id)
      INNER JOIN  companies  ON ( companies_categories.company_id =  companies.id)
      WHERE ( companies.city_id = '#{@quote.city_id}' AND
              companies.state_id = '#{@quote.state_id}' AND
              business_category_translations.title like '%#{solicitud}%')")

      @companies.each do |company|

        @cp =  CompanySolicitude.new
        @cp.solicitude_id =  @obj.id
        @cp.company_id = company.id
        @cp.is_new = true
        @cp.save
      #@obj.solicitude = solicitud
      #@obj.save

    end

    end
  end
    
  
  #if(params[:tag_name].index(",") != nil)
  #params[:tag_name].split(',').each do |c|


  #id = BusinessCategory.all(:include => :translations, :conditions => ['business_category_translations.title = ?', c]).collect(&:id)
  #@id = BusinessCategory.includes(:translations).find(business_category_translations.title = c)
  #id.each do |id|
  #  Quote
  #  QuoteCompanies.save
  # end
  #end
  #---------------------------------------------------------------#

  # PUT /quotes/1
  # PUT /quotes/1.xml
  def update
    @quote = Quote.find(params[:id])

    respond_to do |format|
      if @quote.update_attributes(params[:quote])
        format.html { redirect_to(@quote, :notice => 'Quote was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @quote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1
  # DELETE /quotes/1.xml
  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy

    respond_to do |format|
      format.html { redirect_to(quotes_url) }
      format.xml  { head :ok }
    end
  end

end