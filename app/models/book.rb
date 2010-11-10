class Book < ActiveRecord::Base
  include Pacecar
  
  attr_accessible :title, :available, :synopsis, :published_date, :editorial, :isbn, :user_id, :health_status, :health_description,
                  :tag_list
  validates_presence_of :title, :synopsis, :published_date, :editorial, :isbn, :health_status, :health_description
  acts_as_taggable_on :tags
  
  attr_writer :author_names
  
  has_many :authorships, :dependent => :destroy
  has_many :authors, :through => :authorships
  
  def author_names
    @author_names || authors.map(&:name).join(', ')
  end
    
  private

  def assign_authors
    if @author_names
      self.tags = @author_names.split(/[,;]\s*/).map do |name|
        Author.find_or_create_by_name(name)
      end
    end
  end
  
end
