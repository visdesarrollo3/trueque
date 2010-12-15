class Book < ActiveRecord::Base
  include Pacecar
  
  attr_accessible :title, :available, :synopsis, :published_date, :editorial, :isbn, :user_id, :health_status, :health_description,
                  :tag_list, :author_names, :photo_updated_at, :photo_file_size, :photo_content_type, :photo_file_name, :photo

  validates_presence_of :title, :synopsis, :published_date, :editorial, :isbn, :health_status, :health_description
  
  acts_as_taggable_on :tags
  acts_as_commentable
  acts_as_rateable
  
  extend StoreAttachmentOnS3 if Rails.env.production?
  
  has_attached_file :photo, :styles => { :thumb => "125x145#" },
    :url  => "/uploads/books/:attachment/:id/:style-:basename.:extension",
    :path => ":rails_root/public/uploads/books/:attachment/:id/:style-:basename.:extension",
    :default_style => "thumb"
  
  
  attr_writer :author_names
  after_save :assign_authors
  
  belongs_to :user
  belongs_to :abstract_isbn, :class_name => "Isbn", :foreign_key => "isbn", :primary_key => "isbn"
  
  has_many :authorships, :dependent => :destroy
  has_many :authors, :through => :authorships
  
  has_many :offered_trades, :class_name => "Trade", :foreign_key => "book1_id"
  has_many :receive_trades, :class_name => "Trade", :foreign_key => "book2_id"
  
  belongs_to :trade
  
  scope :offered, :conditions => {:offered => true}
  scope :received, :conditions => {:offered => false}
  scope :newest_first, order("created_at DESC")
  
  def author_names
    @author_names || authors.map(&:name).join(', ')
  end
  
  def mark_as_offered
    update_attribute(:offered, true)
  end
  
  def mark_as_received
    update_attribute(:offered, false)
  end
  
  def name
    title
  end
  
  def trade! was_offered
    abstract_isbn.update_traded_count and self.save
    was_offered ? mark_as_offered : mark_as_received
  end
    
  private

  def assign_authors
    if @author_names
      self.authors = @author_names.split(/[,;]\s*/).map do |name|
        Author.find_or_create_by_name(name)
      end
    end
  end
  
end
