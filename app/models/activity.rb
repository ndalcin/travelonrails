class Activity < ApplicationRecord
  belongs_to :type
  has_many :vacation_activities
  has_many :vacations, through: :vacation_activities
  


  def vacations_attributes=(vacation_attributes)
    vacation_attributes.values.each do |vacation_attribute|
      vacation = Vacation.find_or_create_by(vacation_attribute)
      self.vacations << vacation
    end
  end

end
