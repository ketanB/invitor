class SiteController < ApplicationController
  layout 'with_search_header'
  def index
    @business_categories = BusinessCategory.all(:conditions=>"business_group_id is not null", :limit=>6, :group=>"business_group_id")
  end

  def help
  end

  def populate_location
    location = GeoIp.geolocation(request.ip)
    #user_location_str1 = "miami, FL"
    user_location_str = ''
    user_location_str += "#{location[:city]}, " if location[:city] > ''
    user_location_str += "#{location[:region_name]} " if location[:region_name] > ''
    render :update do |page|
      page << "$('#csz').val('#{user_location_str}')"
    end
  end
  
  def about
  end

  def populate_company
    return unless params[:secret] == 'bolajabena:)'
    #call_rake :populate_company
    call_rake :update_company_lat_long
    redirect_to root_path
  end

  def send_event_reminder
    return unless params[:secret] == 'bolajabena:)'
    call_rake :send_event_reminder
    redirect_to root_path
  end

  def change_language
    @locale = Language.find_by_code params[:locale]
    session[:language]= @locale.code if @locale
    redirect_to :back
  end
end
