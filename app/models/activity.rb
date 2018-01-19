class Activity < ApplicationRecord
  belongs_to :vacation
  has_and_belongs_to_many :types
  accepts_nested_attributes_for :types, :reject_if => proc { |attributes| attributes['name'].blank? }
  # def vacation_activities_attributes=(va_attrs)
  #   va_attrs.values.each do |attribute|
  #     self.vacation_activities.build(attribute)
  #   end
  # end

  def self.top_five
    Activity.order('rating DESC').limit(5)
  end


end
