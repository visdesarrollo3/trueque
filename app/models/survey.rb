class Survey < ActiveRecord::Base
  attr_accessible :question, :featured_at
  validates_presence_of :question
  has_many :survey_options
  
  accepts_nested_attributes_for :survey_options,
                                :allow_destroy => true,
                                :reject_if => proc { |obj| obj.blank? }
  
  
  def total_votes
    (rand * 10).to_i
  end
end
