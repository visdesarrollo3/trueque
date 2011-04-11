class SurveyOption < ActiveRecord::Base
  belongs_to :survey
  validates_presence_of :survey_id, :option
  
  def text
    option
  end
  
  def blank?
    option.blank?
  end
  
  
end
