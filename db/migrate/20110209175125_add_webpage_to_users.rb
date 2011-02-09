class AddWebpageToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :webpage, :string
  end

  def self.down
    remove_column :users, :webpage
  end
end
