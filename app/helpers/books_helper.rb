module BooksHelper
  
  def state_message(book)
    if book.traded?
      "<span class='red'>no disponible</span>"
    else
      "<span class='green'>disponible</span>"
    end
  end
end
