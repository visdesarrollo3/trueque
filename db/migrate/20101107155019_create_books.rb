class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.string :title
      t.boolean :available
      t.text :synopsis
      t.string :published_date
      t.string :editorial
      t.string :isbn
      t.integer :user_id
      t.integer :health_status
      t.text :health_description
      t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end
