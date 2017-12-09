

class Vacation < ApplicationRecord
  belongs_to :destination
  belongs_to :user
  has_many :vacation_activities
  has_many :activities, through: :vacation_activities
  #validates :name, presence: true



  def activities_total
    activities_total = 0
    self.vacation_activities.each do |vacation_activity|
      activities_total += (vacation_activity.activity.price * vacation_activity.people)
    end
    activities_total
  end

end
