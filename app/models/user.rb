class User < ActiveRecord::Base
  attr_accessible :name, :age, :sex, :ocupation, :hobbies, :actual_book, :avatar,
    :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at,
    :password, :login, :email, :webpage
  
  acts_as_authentic do |c|
    c.ignore_blank_passwords = true
    c.validate_password_field = false
  end
  
  ROLES = %w(admin user)
  
  acts_as_commentable
  
  make_permalink :login

  extend StoreAttachmentOnS3 if Rails.env.production?

  has_attached_file :avatar, :styles => { :small => "100x100#", :mini => "35x35#" },
    :default_style => :small


  has_many :books
  has_many :created_comments, :class_name => "Comment", :foreign_key => "user_id"
  
  has_many :offered_trades,   :class_name => "Trade", :foreign_key => "user1_id"
  has_many :received_trades,  :class_name => "Trade", :foreign_key => "user2_id"
  
  has_many :completed_trades,           :class_name => "Trade", :foreign_key => "user1_id", :conditions => { :current_state => :accepted }
  has_many :completed_receibed_trades,  :class_name => "Trade", :foreign_key => "user2_id", :conditions => { :current_state => :accepted }
  
  has_many :given_books,          :through => :completed_trades,          :class_name => "Book", :source => :given_book
  has_many :received_books,       :through => :completed_receibed_trades, :class_name => "Book", :source => :received_book
  
  has_many :waiting_trades,   :class_name => "Trade", :foreign_key => "user1_id", :conditions => { :current_state => :pending  }
  has_many :waiting_books,    :through => :waiting_trades, :class_name => "Book", :source => :received_book
  
  has_many :accepted_trades,  :class_name => "Trade", :foreign_key => "user2_id", :conditions => { :current_state => :accepted }
  has_many :accepted_books,   :through => :accepted_trades, :class_name => "Book", :source => :received_book
  
  has_many :pending_trades,   :class_name => "Trade", :foreign_key => "user2_id", :conditions => { :current_state => :pending  }
  has_many :pending_books,    :through => :pending_trades, :class_name => "Book", :source => :received_book
  
  has_many :votes, :class_name => "SurveyVote"
  has_many :voted_surveys, :through => :votes, :source => :survey

  has_many :grades
  has_many :graded_trades, :through => :grades, :class_name => "Trade", :source => :trade
  
  scope :admins, where(:role => ROLES[0])

  def to_param
    permalink
  end
  
  def name_or_login
    name || login
  end
  
  def has_voted_on(survey)
    voted_surveys.include?(survey)
  end

  def self.create_from_hash(hash)
    user = User.new(:username => hash['user_info']['name'].scan(/[a-zA-Z0-9_]/).to_s.downcase)
    user.save(:validate => false) #create the user without performing validations. This is because most of the fields are not set.
    user.reset_persistence_token! #set persistence_token else sessions will not be created
    user
  end
  
  def admin?
    self.role == ROLES[0]
  end
  
  def user?
    self.persisted? and self.role == ROLES[1]
  end
end
