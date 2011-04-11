class SurveyOption < ActiveRecord::Base
  belongs_to :survey
  validates_presence_of :option
  
  def text
    option
  end
  
  def blank?
    option.blank?
  end
  
  def votes_size
    (rand*100).to_i
  end
  
end
