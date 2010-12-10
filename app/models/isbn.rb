class Isbn < ActiveRecord::Base
  def self.find_or_create_from_book(book)
    mdl = Isbn.find_by_isbn(book.isbn) || Isbn.new_from_book(book)
    mdl
  end
  
  # This won't save the model!
  def self.new_from_book(book)
    mdl = self.new({
      :isbn => book.isbn,
      :name => book.name,
      :times_created => 1,
      :times_traded => 0
    })
    mdl
  end
  
  def update_created_count
    update_attribute(:times_created, times_created + 1)
  end
  
  def update_traded_count
    update_attribute(:times_traded, times_traded + 1)
  end
end
