class Trade < ActiveRecord::Base
  include AASM
  acts_as_commentable
  aasm_column :current_state
  aasm_initial_state :pending

  aasm_state :pending
  aasm_state :ignored
  aasm_state :accepted, :enter => :apply_trade
  
  aasm_event :ignore do
    transitions :to => :ignored, :from => [:pending]
  end

  aasm_event :accept do
    transitions :to => :accepted, :from => [:pending]
  end
  
  attr_accessible :book1_id, :book2_id, :user1_id, :user2_id
  
  belongs_to :initiator,      :class_name => "User", :foreign_key => "user1_id"
  belongs_to :receiver,       :class_name => "User", :foreign_key => "user2_id"
  belongs_to :given_book,     :class_name => "Book", :foreign_key => "book1_id"
  belongs_to :received_book,  :class_name => "Book", :foreign_key => "book2_id"
  
  has_many :grades, :limit => 2
    
  scope :completed, :conditions => {:accepted => true}
  scope :pending,   :conditions => {:accepted => nil}
  scope :denied,    :conditions => {:accepted => false}
  
  def user1
    initiator
  end
  
  def user2
    receiver
  end
  
  def book1
    given_book
  end
  
  def book2
    received_book
  end
  
  def book1=(book)
    given_book = book
  end
  
  def book2=(book)
    received_book = book
  end
  
  def status
    aasm_current_state
  end
  
  def apply_trade
    Trade.transaction do
      logger.error {"\n\n\n ************ #{self.received_book.inspect} \n\n\n"}
      given_book.trade = received_book.trade = self
      self.save
      given_book.trade!(true) and received_book.trade!(false)
    end
  end
  
  def pending?
    accepted.nil?
  end
  
  def denied?
    !accepted?
  end
end
