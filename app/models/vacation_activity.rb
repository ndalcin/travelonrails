

class VacationActivity < ApplicationRecord
  belongs_to :vacation, inverse_of: :vacation_activities
  belongs_to :activity, inverse_of: :vacation_activities

  validates :people, presence: true

  def total_cost
    self.activity.price * self.people
  end
  
end
