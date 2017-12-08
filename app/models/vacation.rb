class Vacation < ApplicationRecord
  belongs_to :destination
  belongs_to :user
  has_many :vacation_activities
  has_many :activities, through: :vacation_activities

  validates :name, presence: true

  def activities_total
    activities_total = 0
    self.activities.each do |activity|
      activities_total += activity.price
    end
    activities_total
  end

end
