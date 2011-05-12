# coding: utf-8
class Book < ActiveRecord::Base
  default_scope order("created_at DESC")
  include Pacecar
  
  attr_accessible :title, :available, :synopsis, :published_date, :editorial, :isbn, :user_id, :health_status, :health_description,
                  :tag_list, :author_names, :photo_updated_at, :photo_file_size, :photo_content_type, :photo_file_name, :photo

  acts_as_taggable_on :tags
  acts_as_commentable
  
  extend StoreAttachmentOnS3 if Rails.env.production?
  
  has_attached_file :photo,
              :styles => { :thumb => "125x145#", :big => "230x300#" },
              :default_style => "thumb"

  validates_presence_of :title, :synopsis, :published_date, :editorial, :isbn, :health_status, :health_description, :photo

  before_create :find_or_create_isbn
  
  attr_writer :author_names
  after_save :assign_authors
  
  belongs_to :user
  belongs_to :abstract_isbn, :class_name => "Isbn", :foreign_key => "isbn", :primary_key => "isbn"
  
  has_many :authorships, :dependent => :destroy
  has_many :authors, :through => :authorships
  
  has_many :offered_trades,   :class_name => "Trade", :foreign_key => "book1_id"
  has_many :received_trades,  :class_name => "Trade", :foreign_key => "book2_id"
  
  belongs_to :trade
  
  scope :offered,       where(:offered  => true  )
  scope :received,      where(:offered  => false )
  scope :available,     where(:trade_id => nil   )
  scope :newest_first,  order("created_at DESC"  )
  
  make_permalink :title
  
  def to_param
    permalink
  end
  
  def cover
    photo
  end
  
  def traded?
    !available?
  end
  
  def available?
    trade.nil?
  end
  
  def traded_with
    begin
      offered ? trade.receiver : trade.initiator
    rescue Exception => e
      nil
    end
  end
  
  def author_names
    @author_names ||= authors.map(&:name).join(', ')
  end
  
  def tag_names
    @tag_names ||= tags_on(:tags).map(&:name).map(&:titleize).join(", ")
  end
  
  def name
    title
  end
  
  def name=(name)
    title = name
  end
  
  def mark_as_offered!
    update_attribute(:offered, true)
  end
  
  def mark_as_received!
    update_attribute(:offered, false)
  end
  
  def trade! was_offered = false
    abstract_isbn.update_traded_count and self.save
    was_offered ? mark_as_offered! : mark_as_received!
  end
  
  private
  
  def find_or_create_isbn
    abstract_isbn = Isbn.find_or_create_from_book(self)
    abstract_isbn.save
  end

  def assign_authors
    if @author_names
      self.authors = @author_names.split(/[,;]\s*/).map do |name|
        Author.find_or_create_by_name(name)
      end
    end
  end
  
end
