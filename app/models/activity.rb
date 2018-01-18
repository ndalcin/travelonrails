class Activity < ApplicationRecord
  belongs_to :type
  has_many :vacation_activities
  has_many :vacations, through: :vacation_activities

  def vacation_activities_attributes=(va_attrs)
    va_attrs.values.each do |attribute|
      self.vacation_activities.build(attribute)
    end
  end

  def self.top_five
    Activity.order('rating DESC').limit(5)
  end


end
