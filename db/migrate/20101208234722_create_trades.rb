class CreateTrades < ActiveRecord::Migration
  def self.up
    create_table :trades do |t|
      t.integer :book1_id
      t.integer :book2_id
      t.integer :user1_id
      t.integer :user2_id
      t.boolean :accepted
      t.timestamps
    end
  end

  def self.down
    drop_table :trades
  end
end
