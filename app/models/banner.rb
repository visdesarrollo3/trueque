class Banner < ActiveRecord::Base
  attr_accessible :name, :photo_updated_at, :photo_file_size, :photo_content_type,
    :photo_file_name, :photo, :link, :description, :new_window, :published, :position
  
  POSITIONS = %w(main vertical)
  
  extend StoreAttachmentOnS3 if Rails.env.production?
  
  has_attached_file :photo,
    :styles => {
        :gallery => "680x270#",
        :thumb => "100x100#",
        :vertical => "225x270#"
    },
    :default_style => "gallery"
  
end
