

class VacationActivity < ApplicationRecord
  validates :people, presence: true
  
  belongs_to :vacation, inverse_of: :vacation_activities
  belongs_to :activity, inverse_of: :vacation_activities



  def total_cost
    self.activity.price * self.people
  end

end
