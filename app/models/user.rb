class User < ActiveRecord::Base
  attr_accessible :name, :age, :sex, :ocupation, :hobbies, :actual_book, :avatar,
  :avatar_file_name, :avatar_content_type, :avatar_file_size, :avatar_updated_at,
  :password, :login, :email, :webpage
  
  acts_as_authentic do |c|
    c.ignore_blank_passwords = true
    c.validate_password_field = false
  end
  
  acts_as_commentable
  make_permalink :login

  extend StoreAttachmentOnS3 if Rails.env.production?

  has_attached_file :avatar, :styles => { :small => "100x100#" },
    :path => "/uploads/users/:attachment/:id/:style-:basename.:extension"


  has_many :books
  has_many :created_comments, :class_name => "Comment", :foreign_key => "user_id"
  
  has_many :offered_trades,  :class_name => "Trade", :foreign_key => "user1_id"
  has_many :received_trades, :class_name => "Trade", :foreign_key => "user2_id"
  
  has_many :completed_trades, :class_name => "Trade", :foreign_key => "user1_id", :conditions => {:current_state => :accepted}
  has_many :waiting_trades,   :class_name => "Trade", :foreign_key => "user1_id", :conditions => {:current_state => :pending}
  
  has_many :accepted_trades,  :class_name => "Trade", :foreign_key => "user2_id", :conditions => {:current_state => :accepted}
  has_many :pending_trades,   :class_name => "Trade", :foreign_key => "user2_id", :conditions => {:current_state => :pending}

  def to_param
    permalink
  end

  def self.create_from_hash(hash)
    user = User.new(:username => hash['user_info']['name'].scan(/[a-zA-Z0-9_]/).to_s.downcase)
    user.save(:validate => false) #create the user without performing validations. This is because most of the fields are not set.
    user.reset_persistence_token! #set persistence_token else sessions will not be created
    user
  end
  
  #here we add required validations for a new record and pre-existing record
  # validate do |user|
  #   if user.new_record? #adds validation if it is a new record
  #     user.errors.add(:password, "is required") if user.password.blank? 
  #     user.errors.add(:password_confirmation, "is required") if user.password_confirmation.blank?
  #     user.errors.add(:password, "Password and confirmation must match") if user.password != user.password_confirmation
  #   elsif !(!user.new_record? && user.password.blank? && user.password_confirmation.blank?) #adds validation only if password or password_confirmation are modified
  #     user.errors.add(:password, "is required") if user.password.blank?
  #     user.errors.add(:password_confirmation, "is required") if user.password_confirmation.blank?
  #     user.errors.add(:password, " and confirmation must match.") if user.password != user.password_confirmation
  #     user.errors.add(:password, " and confirmation should be atleast 4 characters long.") if user.password.length < 4 || user.password_confirmation.length < 4
  #   end
  # end  

  
  
end
