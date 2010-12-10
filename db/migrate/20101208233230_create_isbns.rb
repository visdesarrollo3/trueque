class CreateIsbns < ActiveRecord::Migration
  def self.up
    create_table :isbns do |t|
      t.string :isbn
      t.integer :times_traded, :default => 0
      t.integer :times_created, :default => 1
      t.string :book_name

      t.timestamps
    end
  end

  def self.down
    drop_table :isbns
  end
end
