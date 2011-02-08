class CreateVitamins < ActiveRecord::Migration
  def self.up
    create_table :vitamins do |t|
      t.string :name
      t.string :video_code
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :vitamins
  end
end
