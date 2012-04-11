module CompaniesHelper

  def add_object_link(name, form, object, partial, where)
    html = render(:partial => partial, :locals => { :form => form}, :object => object)
    link_to_function name,  %{
      var new_object_id = new Date().getTime() ;
      var html = jQuery(#{js html}.replace(/index_to_replace_with_js/g, new_object_id)).hide();
      html.appendTo(jQuery("#{where}")).slideDown('slow');
    }, :class=> 'addMoreImage'
  end

  def js(data)
    if data.respond_to? :to_json
      data.to_json
    else
      data.inspect.to_json
    end
  end

  def tag_list_link(tags)
    return '' if tags.size == 0
    str_arr = []
    tags.each do |tag|
      str_arr << link_to(tag.name, search_companies_path(:tag_name => tag.name))
    end
    return str_arr.join(',')
  end

  def category_list_link(cats, action = "search")
    return '' if cats.size == 0
    str_arr = []
    cats.each do |cat|
      str_arr << link_to(cat.title, url_for(params.merge(:cat => cat.title).merge(:action => action)), :class => "remote-search")
    end
    return str_arr.join(',')
  end


end
