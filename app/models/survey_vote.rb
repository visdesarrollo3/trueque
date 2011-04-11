class SurveyVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :option, :class_name => "SurveyOption",  :foreign_key => "option_id"
  belongs_to :survey, :class_name => "Survey",        :foreign_key => "survey_id"
  
  before_validation :associate_with_survey
  validates_presence_of :user_id, :option_id, :survey_id
  
  private
  
  def associate_with_survey
    self.survey = self.option.survey if self.survey.nil? && !self.option.nil?
  end
end
