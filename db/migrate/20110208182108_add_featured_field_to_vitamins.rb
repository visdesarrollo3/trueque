class AddFeaturedFieldToVitamins < ActiveRecord::Migration
  def self.up
    add_column :vitamins, :featured, :boolean, :default => false
  end

  def self.down
    remove_column :vitamins, :featured
  end
end
