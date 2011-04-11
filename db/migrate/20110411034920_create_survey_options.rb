class CreateSurveyOptions < ActiveRecord::Migration
  def self.up
    create_table :survey_options do |t|
      t.integer :survey_id
      t.string :option

      t.timestamps
    end
  end

  def self.down
    drop_table :survey_options
  end
end
