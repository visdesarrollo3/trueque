class ForumCategory < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :name
  
  has_many :forum_threads
  has_many :recent_threads, :class_name => "ForumThread", :limit => 2
  
  make_permalink :name
  
  def to_param
    permalink
  end
end
