class Survey < ActiveRecord::Base
  attr_accessible :question, :featured_at
  validates_presence_of :question
  
  def total_votes
    (rand * 10).to_i
  end
end
