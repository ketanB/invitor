class AdminController < ApplicationController

  before_filter :admin?
  
  def index
    
  end

  def events
    @events = initialize_grid(Event,
      :page => params[:page],      
      :order => 'id',
      :order_direction => 'desc')
  end

  def add_pictures
    @categories = Category.all    
    @countries = Country.all

  end

  def categories
    cat = Category.all(:conditions=>["country_id=?", params[:c_id]])
    render :text=>cat.collect{|p| "<option value='#{p.id}'>#{p.name}</option>"} and return
  end

  def add_desgins
    @categories = Category.all :include=>:translations
    @countries = Country.all
    if request.method == "POST"      
      if params[:new_cat].blank?
        cat = Category.find_by_id params[:cat][:id]
      else
        cat = Category.create(:name=>params[:new_cat], :country_id=>params[:country][:id])
      end
      
      theme = Theme.new
      theme.bg_image = params[:bg_image]
      theme.main_image = params[:main_image]
      cat.themes << theme
    end
  end
  

end
