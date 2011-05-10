class ForumThread < ActiveRecord::Base
  default_scope order("created_at DESC")
  attr_accessible :title, :body, :forum_category_id, :user_id
  belongs_to :forum_category
  belongs_to :user
  validates_presence_of :title, :body, :forum_category_id
  acts_as_commentable
  make_permalink :title
  
  alias :category :forum_category

  def to_param
    permalink
  end

  def comment
    body
  end

end
