class Vitamin < ActiveRecord::Base
  attr_accessible :name, :video_code, :description
  validates_presence_of :name, :video_code
  
  
  def embed_code
    "<iframe title='#{self.name}' width='640' height='510' src='http://www.youtube.com/embed/#{self.video_code}?rel=0&amp;hd=1' frameborder='0' allowfullscreen> </iframe>"
  end
end
