

class Activity < ApplicationRecord
  belongs_to :type
  has_many :vacation_activities
  has_many :vacations, through: :vacation_activities

  accepts_nested_attributes_for :vacation_activities


  def self.top_five
    Activity.order('rating DESC').limit(5)
  end



end
