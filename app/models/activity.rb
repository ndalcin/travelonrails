class Activity < ApplicationRecord
  belongs_to :type
  has_many :vacation_activities
  has_many :vacations, through: :vacation_activities

  def self.top_rated
    self.maximum("rating")
  end
end
