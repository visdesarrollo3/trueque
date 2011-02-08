class AddIndexesToEverything < ActiveRecord::Migration
  def self.up
    add_index :authors, :name
    add_index :isbns, :isbn
    add_index :pages, :permalink
    add_index :trades, [:book1_id, :book2_id, :user1_id, :user2_id]
  end

  def self.down

  end
end
