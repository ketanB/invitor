module ApplicationHelper
  def title(page_title)
    @title = page_title
  end

  def show_flash
    [:notice, :error].collect do |key|
      content_tag(:div, content_tag(:p, flash[key]), :id => "flash", :class => "flash_#{key}") unless flash[key].blank?
    end.join
  end

  def flash_is_displayed
    flash[:notice] or flash[:error]
  end

  def customize_javascript(*args)
    args = args.map { |arg| arg == :defaults ? arg : arg.to_s }
    content_for(:javascript_include) { javascript_include_tag(*args) }
  end

  def customize_javascript_tag(func)
    content_for(:javascript_tag) { javascript_tag(func) }
  end

  def customize_stylesheet(*args)
    args = args.map { |arg| arg == :defaults ? arg : arg.to_s }
    content_for(:stylesheet) { stylesheet_link_tag(*args) }
  end

  def page_entries_info(collection, options = {})
    entry_name = options[:entry_name] ||
      (collection.empty?? 'entry' : collection.first.class.name.underscore.sub('_', ' '))

    if collection.total_pages < 2
      case collection.size
      when 0; "No item found"
      else;   "Displaying all"
      end
    else
      %{%d - %d of %d} % [
        collection.offset + 1,
        collection.offset + collection.length,
        collection.total_entries
      ]
    end

  end

end

