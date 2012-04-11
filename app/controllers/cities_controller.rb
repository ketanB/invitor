class CitiesController < ApplicationController
  layout 'admin'
  # GET /cities
  # GET /cities.xml
  def index
    @cities = City.paginate(:page=> params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cities }
    end
  end

  # GET /cities/1
  # GET /cities/1.xml
  def show
    @city = City.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @city }
    end
  end

  # GET /cities/new
  # GET /cities/new.xml
  def new
    @city = City.new
    @states = []
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @city }
    end
  end

  # GET /cities/1/edit
  def edit
    @city = City.find(params[:id])
    @states = [@city.state]
  end

  # POST /cities
  # POST /cities.xml
  def create
    @city = City.new(params[:city])

    respond_to do |format|
      if @city.save
        format.html { redirect_to(@city, :notice => 'City was successfully created.') }
        format.xml  { render :xml => @city, :status => :created, :location => @city }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @city.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cities/1
  # PUT /cities/1.xml
  def update
    @city = City.find(params[:id])

    respond_to do |format|
      if @city.update_attributes(params[:city])
        format.html { redirect_to(@city, :notice => 'City was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @city.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cities/1
  # DELETE /cities/1.xml
  def destroy
    @city = City.find(params[:id])
    @city.destroy

    respond_to do |format|
      format.html { redirect_to(cities_url) }
      format.xml  { head :ok }
    end
  end

  def load_states
    @states = State.where(:country_id => params[:country_id]).all
  end

  ###------------------------------ My Code --------------------------------###
  def autocomplete
    #items = City.find(:all, :include => "city_traslations" , :conditions => ["name like ?", "%#{params[:term]}%"]).limit(15)
    #items = City.find(:all, :conditions => ["name like ?", "%#{params[:term]}%"]).limit(15)
     # "name like('%#{params[:term]}%')").limit(15)
     #cities = City.find_by_sql ("select t.name from city_translations t where t.name like 'Woodstock'")
    #items = City.find(:all).name => "Woodstock"
    #(city_translations.name.like('%#{params[:term]}%')).limit(15)
     
     

    #render :json => json_for_autocomplete(items, :name)
  end

  ###-----------------------------------------------------------------------###

end
