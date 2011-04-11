class SurveyOption < ActiveRecord::Base
  belongs_to :survey
  validates_presence_of :option
  has_many :votes, :class_name => "SurveyVote", :foreign_key => "option_id"
  
  def text
    option
  end
  
  def blank?
    option.blank?
  end
end
