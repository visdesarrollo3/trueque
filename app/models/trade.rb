class Trade < ActiveRecord::Base
  attr_accessible :book1_id, :book2_id, :user1_id, :user2_id
  
  belongs_to :initiator,      :class_name => "User", :foreign_key => "user1_id"
  belongs_to :receiver,       :class_name => "User", :foreign_key => "user2_id"
  belongs_to :given_book,     :class_name => "Book", :foreign_key => "book1_id"
  belongs_to :received_book,  :class_name => "Book", :foreign_key => "book2_id"
  
  
  scope :completed, :conditions => {:accepted => true}
  scope :pending,   :conditions => {:accepted => nil}
  scope :denied,    :conditions => {:accepted => false}
  
  def apply_trade
    Trade.transaction do
      given_book.trade = received_book.trade = self
      self.save
      given_book.trade! and received_book.trade!
    end
  end
end
