class AddNameFieldToIsbNs < ActiveRecord::Migration
  def self.up
    add_column :isbns, :name, :string
  end

  def self.down
    remove_column :isbns, :name
  end
end
