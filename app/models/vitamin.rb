class Vitamin < ActiveRecord::Base
  attr_accessible :name, :video_code, :description, :featured
  validates_presence_of :name, :video_code
  
  scope :featured, where(:featured => true).limit(1)
  
  acts_as_commentable
  
  def video_url
    "http://www.youtube.com/watch?v=#{video_code}"
  end
  
  def embed_code
    "<iframe title='#{self.name}' width='640' height='510' src='http://www.youtube.com/embed/#{self.video_code}?rel=0&amp;hd=1' frameborder='0' allowfullscreen> </iframe>"
  end
  
  def small_embed_code
    "<iframe title='#{self.name}' width='600' height='350' src='http://www.youtube.com/embed/#{self.video_code}?rel=0&amp;hd=1' frameborder='0' allowfullscreen> </iframe>"
  end
  
  def demote!
    update_attribute(:featured, false)
  end
end
