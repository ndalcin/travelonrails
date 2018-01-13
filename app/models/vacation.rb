

class Vacation < ApplicationRecord
  belongs_to :destination
  belongs_to :user
  has_many :vacation_activities
  has_many :activities, through: :vacation_activities

  validates :name, presence: true
  validates :destination_id, presence: true
  validates :budget, presence: true, :numericality => { :only_integer => true, :greater_than => 0 }
  validates :length, presence: true, :numericality => { :only_integer => true, :greater_than => 0 }
  validates :date, presence: true


  def activities_total
    activities_total = 0
    self.vacation_activities.each do |vacation_activity|
      activities_total += (vacation_activity.activity.price * vacation_activity.people)
    end
    activities_total
  end

  def budget_remaining
    self.budget - self.activities_total
  end

  def broke?
    true if self.budget_remaining < 0
  end    


end
