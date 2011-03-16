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
  
end
