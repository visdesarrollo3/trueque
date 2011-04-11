class Survey < ActiveRecord::Base
  attr_accessible :question, :featured_at, :options, :options_attributes
  has_many :options, :class_name => "SurveyOption"
  validates_presence_of :question, :options
  accepts_nested_attributes_for :options,
                                :allow_destroy => true,
                                :reject_if => proc { |obj| obj.blank? }
  
  
  def total_votes
    (rand * 10).to_i
  end
  
end
