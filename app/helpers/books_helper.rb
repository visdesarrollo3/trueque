module BooksHelper
  
  def tag_links(book)
    book.tags.map{|t| link_to t.name.titleize, "#"}.join(", ").html_safe
  end
  
  def state_message(book)
    if book.traded?
      "<span class='red'>no disponible</span>"
    else
      "<span class='green'>disponible</span>"
    end
  end
end
