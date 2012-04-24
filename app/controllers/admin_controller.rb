class AdminController < ApplicationController

  before_filter :admin_required?
  
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
    if request.method == "POST"      
      cat = Category.find_by_id params[:cat][:id]   
      theme = Theme.new
      theme.main_image = params[:main_image]
      cat.themes << theme
    end
    
  end

  def categories
    @categories = Category.all(:conditions=>["country_id=?", params[:c_id]])
    render :udpate do  |page|
      page[:categories_div].replace_html :partial => "categories", :locals => {:categories => @categories}
    end
    #    render :text=>cat.collect{|p| "<option value='#{p.id}'>#{p.name}</option>"} and return
  end

  def add_pattern
    @categories = Category.all  :include => :translations
    @countries = Country.all
    if request.method == "POST"

      if params[:new_cat].blank?
        unless params[:category][:id] == "New Category"
          cat = Category.find_by_id(params[:category][:id])
        end
      else
        cat = Category.create(:name=>params[:new_cat], :country_id=>params[:country][:id])
      end

      unless cat.blank?
        if params[:image]
          pattern = Pattern.new
          pattern.image = params[:image]
          pattern.category_id = cat.id
          if pattern.save
            flash[:notice] = "Pattern uploaded successfully!"
            return redirect_to all_patterns_path
          end
        else
          flash[:notice] = "Please provide image!."
          redirect_to new_pattern_path
        end
      end
      flash[:notice] = "Pattern can not be saved, please select or enter some category."
      redirect_to new_pattern_path
    end
  end

  def add_desgin
    @categories = Category.all  :include => :translations
    @countries = Country.all   
    if request.method == "POST"

      if params[:new_cat].blank?
        unless params[:category][:id] == "New Category"
          cat = Category.find_by_id(params[:category][:id])        
        end
      else
        cat = Category.create(:name=>params[:new_cat], :country_id=>params[:country][:id])
      end

      unless cat.blank?
        if params[:bg_image] and params[:main_image]
          theme = Theme.new
          theme.tag_list = params[:theme][:tag_list]
          theme.bg_image = params[:bg_image]
          theme.main_image = params[:main_image]
          theme.category_id = cat.id
          if theme.save
            flash[:notice] = "Design uploaded successfully!"
            return redirect_to all_designs_path
          end
        else
          flash[:notice] = "Any or both of the images are missing."
          redirect_to new_design_path
        end
      end
      flash[:notice] = "Design can not be saved, please select or enter some category."
      redirect_to new_design_path
    end
  end

  def designs_index
    @countries = Country.includes(:translations).order('country_translations.name')
    if request.xhr?
      if params[:cat_id] and params[:cat_id].to_s != "none"
        @designs = Theme.all :conditions => ["category_id=?", params[:cat_id]]
        render :update do |page|
          page[:designs_div].replace_html :partial => "searched_designs", :locals => {:designs => @designs}
        end
      else
        @designs = Theme.all
        render :update do |page|
          page[:designs_div].replace_html :partial => "searched_designs", :locals => {:designs => @designs}
        end
      end
    end   
  end

  def patterns_index
    @countries = Country.includes(:translations).order('country_translations.name')
    if request.xhr?
      if params[:cat_id] and params[:cat_id].to_s != "none"
        @patterns = Pattern.all :conditions => ["category_id=?", params[:cat_id]]
        render :update do |page|
          page[:patterns_div].replace_html :partial => "searched_patterns", :locals => {:patterns => @patterns}
        end
      else
        @patterns = Pattern.all
        render :update do |page|
          page[:patterns_div].replace_html :partial => "searched_patterns", :locals => {:patterns => @patterns}
        end
      end
    end
  end

  def get_categories_by_country    
    @countries = Category.find_all_by_country_id(params[:country])    
    render :update do |page|
      page[:categories_div].replace_html :partial => 'searched_designs'
    end
  end

  def edit_theme
    @design = Theme.find_by_id(params[:id])
    @countries = Country.all
    @categories = Category.all :conditions => ["country_id=?", @design.category.country_id], :include => :translations
    
    if request.method == "POST"
      if params[:new_cat].blank?
        cat = Category.find_by_id params[:category][:id]
      else
        cat = Category.create(:name=>params[:new_cat], :country_id=>params[:country][:id])
      end
      
      @design.bg_image = params[:bg_image] if params[:bg_image]
      @design.main_image = params[:main_image] if params[:main_image]
      @design.category_id = cat.id
      @design.tag_list = params[:theme][:tag_list]
      @design.save
      flash[:notice] = "Design updated successfully!"
      return redirect_to all_designs_path
      
    end
  end

  def edit_pattern
    @pattern = Pattern.find_by_id(params[:id])
    @countries = Country.all
    @categories = Category.all :conditions => ["country_id=?", @pattern.category.country_id], :include => :translations

    if request.method == "POST"
      if params[:new_cat].blank?
        cat = Category.find_by_id params[:category][:id]
      else
        cat = Category.create(:name=>params[:new_cat], :country_id=>params[:country][:id])
      end

      @pattern.image = params[:image] if params[:image]
      @pattern.category_id = cat.id
      @pattern.save
      flash[:notice] = "Pattern updated successfully!"
      return redirect_to all_patterns_path
    end
  end

  def destroy_pattern
    @pattern = Pattern.find_by_id(params[:id])
    if @pattern.destroy
      flash[:notice] = "Pattern deleted successfully!"
    else
      flash[:notice] = "Pattern was not deleted successfully!"
    end
    return redirect_to all_patterns_path
  end

  def destroy_theme
    @design = Theme.find_by_id(params[:id])
    if @design.destroy
      flash[:notice] = "Design deleted successfully!"
    else
      flash[:notice] = "Design was not deleted successfully!"
    end
    return redirect_to all_designs_path
  end

  def business_categories
    @business_categories = BusinessCategory.paginate(:page=>params[:page], :conditions=>"business_group_id is not null", :limit=>6, :group=>"business_group_id")
   
    if request.method == "POST"
      business_category = BusinessCategory.find_by_id params[:id]
      business_category.icon = params[:icon][business_category.id.to_s]
      business_category.save
    end
  end
  

end
