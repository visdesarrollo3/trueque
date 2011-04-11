class CreateSurveyVotes < ActiveRecord::Migration
  def self.up
    create_table :survey_votes do |t|
      t.integer :user_id
      t.integer :option_id
      t.integer :survey_id
      t.timestamps
    end
  end

  def self.down
    drop_table :survey_votes
  end
end
