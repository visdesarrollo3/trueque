class SurveyVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :option, :class_name => "SurveyOption",  :foreign_key => "option_id"
  belongs_to :survey, :class_name => "Survey",        :foreign_key => "survey_id"
  
  before_create :associate_with_survey
  
  private
  
  def associate_with_survey
    self.survey = self.option.survey
  end
end
