class Page < ActiveRecord::Base
  attr_accessible :name, :permalink, :content
  
  validates_presence_of :name, :content
  
  make_permalink :name, :include_id => false
  
  before_save :create_permalink
  
  def self.find(id)
    self.find_by_permalink(id) || super(id)
  end
  
  
  
  def to_param
    self.permalink
  end
  
  private
  
  def create_permalink
    self.permalink = permalink
  end
end
