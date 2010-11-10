class Page < ActiveRecord::Base
  attr_accessible :name, :permalink, :content
  validates_presence_of :name, :content
  make_permalink :name, :include_id => false
  
  before_save :create_permalink
  
  private
  def create_permalink
    self.permalink = permalink
  end
end
