module UsersHelper

  def render_contact_group_select(contact_groups, selected = nil)
    select_tag 'contact[contact_group_id]', options_from_collection_for_select(contact_groups, :id, :name, selected)
  end

  def render_weather(city)
    weather_info = Hpricot::XML(open("http://www.google.com/ig/api?weather=#{city}&hl=#{I18n.locale.to_s}"))
    w_arr = []
    (weather_info/'forecast_conditions').each do |fc|
      tmp_hash = {}
      tmp_hash[:day]= fc.at('day_of_week').attributes['data']
      tmp_hash[:low]= fc.at('low').attributes['data']
      tmp_hash[:high]= fc.at('high').attributes['data']
      tmp_hash[:icon]= fc.at('icon').attributes['data']


      w_arr << tmp_hash
    end
    str = "<ul class='weather_forecast'>"
    w_arr.each do |data|
      str += "<li><img  src='http://google.com#{data[:icon]}'/> <span><label class='day'>#{data[:day]}</label><br/><label class='temparature'>#{data[:high]} / #{data[:low]}</label></span></li>"
    end
    str += "</ul>"
    str
  end
  
end
