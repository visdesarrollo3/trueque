class Survey < ActiveRecord::Base
  default_scope order("featured_at DESC").includes([:options, :votes])
  attr_accessible :question, :featured_at, :options, :options_attributes
  has_many :options,  :class_name => "SurveyOption"
  has_many :votes,    :class_name => "SurveyVote"
  
  validates_presence_of :question, :options
  accepts_nested_attributes_for :options,
                                :allow_destroy => true,
                                :reject_if => proc { |obj| obj.blank? }
  
  make_permalink :question
  
  def to_param
    permalink
  end
  
  def total_votes
    (rand * 10).to_i
  end
  
end
