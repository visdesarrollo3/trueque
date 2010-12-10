class AddMoreFieldsToBanners < ActiveRecord::Migration
  def self.up
    add_column :banners, :published, :boolean
    add_column :banners, :position, :string
  end

  def self.down
    remove_column :banners, :position
    remove_column :banners, :published
  end
end
