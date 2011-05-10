class ForumThread < ActiveRecord::Base
  default_scope order("created_at DESC")
  attr_accessible :title, :body, :forum_category_id
  belongs_to :forum_category
  validates_presence_of :title, :body, :forum_category_id
  acts_as_commentable
end
