class AddTradeIdAndOfferedFieldsToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :offered, :boolean
    add_column :books, :trade_id, :integer
  end

  def self.down
    remove_column :books, :trade_id
    remove_column :books, :offered
  end
end
