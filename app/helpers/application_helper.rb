module ApplicationHelper
include TagsHelper

  def errors_for(object, message=nil)
    html = ""
    unless object.errors.blank?
      html << "<div class='formErrors #{object.class.name.humanize.downcase}Errors'>\n"
      if message.blank?
        if object.new_record?
          html << "\t\t<h5>There was a problem creating the #{object.class.name.humanize.downcase}</h5>\n"
        else
          html << "\t\t<h5>There was a problem updating the #{object.class.name.humanize.downcase}</h5>\n"
        end
      else
        html << "<h5>#{message}</h5>"
      end
      html << "\t\t<ul>\n"
      object.errors.full_messages.each do |error|
        html << "\t\t\t<li style='font-size:12px;'>#{error}</li>\n"
      end
      html << "\t\t</ul>\n"
      html << "\t</div>\n"
    end
    html
  end

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

