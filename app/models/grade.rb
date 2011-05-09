class Grade < ActiveRecord::Base
  attr_accessible :user_id, :trade_id, :score
  
  belongs_to :user
  belongs_to :trade
  
  validates_presence_of :user_id, :trade_id, :score
end
