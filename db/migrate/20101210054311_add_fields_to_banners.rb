class AddFieldsToBanners < ActiveRecord::Migration
  def self.up
    add_column :banners, :description, :text
    add_column :banners, :link, :string
    add_column :banners, :new_window, :boolean
  end

  def self.down
    remove_column :banners, :link
    remove_column :banners, :description
    remove_column :banners, :new_window
  end
end
