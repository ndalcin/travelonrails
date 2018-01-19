

class Vacation < ApplicationRecord
  belongs_to :user
  belongs_to :destination
  has_many :activities

  validates :name, presence: true
  validates :budget, presence: true, :numericality => { :only_integer => true, :greater_than => 0 }
  validates :destination_id, presence: true
  validates :user_id, presence: true
  validates :people, presence: true

  def activities_total
    activities_total = 0
    self.activities.each do |activity|
      activities_total += (activity.price * activity.people)
    end
    activities_total
  end

  def budget_remaining
    self.budget - self.activities_total
  end

  def broke?
    true if self.budget_remaining < 0
  end

  def next
    user.vacations.where('id > ?', self.id).first
  end

  def previous
    user.vacations.where('id < ?', self.id).last
  end

end
