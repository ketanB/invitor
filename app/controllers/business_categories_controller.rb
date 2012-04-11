class BusinessCategoriesController < ApplicationController
  layout 'admin'
  # GET /business_categories
  # GET /business_categories.xml
  def index
    @business_categories = BusinessCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @business_categories }
    end
  end

  # GET /business_categories/1
  # GET /business_categories/1.xml
  def show
    @business_category = BusinessCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @business_category }
    end
  end

  # GET /business_categories/new
  # GET /business_categories/new.xml
  def new
    @business_category = BusinessCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @business_category }
    end
  end

  # GET /business_categories/1/edit
  def edit
    @business_category = BusinessCategory.find(params[:id])
  end

  # POST /business_categories
  # POST /business_categories.xml
  def create
    @business_category = BusinessCategory.new(params[:business_category])

    respond_to do |format|
      if @business_category.save
        format.html { redirect_to(@business_category, :notice => 'Business category was successfully created.') }
        format.xml  { render :xml => @business_category, :status => :created, :location => @business_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @business_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /business_categories/1
  # PUT /business_categories/1.xml
  def update
    @business_category = BusinessCategory.find(params[:id])

    respond_to do |format|
      if @business_category.update_attributes(params[:business_category])
        format.html { redirect_to(@business_category, :notice => 'Business category was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @business_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /business_categories/1
  # DELETE /business_categories/1.xml
  def destroy
    @business_category = BusinessCategory.find(params[:id])
    @business_category.destroy

    respond_to do |format|
      format.html { redirect_to(business_categories_url) }
      format.xml  { head :ok }
    end
  end
end
