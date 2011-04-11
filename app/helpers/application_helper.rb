module ApplicationHelper
  
  def link_to_or_default(content, obj, options = {})
    return unless obj.respond_to?(:link)
    if obj.link
      options[:target] = "_blank" if obj.respond_to?(:new_window) && obj.new_window?
      link_to content, obj.link, options
    else
      content
    end
  end
  
  def trade_link(book)
    link_to "Truequear", trades_path(:book_id => book.id), :method => :post, :class => "button"
  end
  
  def book_image(book, image_size)
    if book.user.admin?
      ribbon_image(book, image_size)
    else
      content_tag :div, image_tag(book.photo.url(image_size)), :class => "cover"
    end
  end
  
  def ribbon_image(book, size)
    content_tag :div, :class => "book-cover" do
      [
        image_tag(book.photo.url(size)),
        content_tag(:div, "Esquina del Trueque", :class => "ribbon-#{size}")
      ].join("").html_safe
        
    end
  end
  
end
