class Banner < ActiveRecord::Base
  attr_accessible :name, :photo_updated_at, :photo_file_size, :photo_content_type, :photo_file_name, :photo
  
  has_attached_file :photo, :styles => { :gallery => "680x270#", :thumb => "100x100#" },
    :url  => "/uploads/banners/:attachment/:id/:style-:basename.:extension",
    :path => ":rails_root/public/uploads/banners/:attachment/:id/:style-:basename.:extension",
    :default_style => "gallery"
  
end
