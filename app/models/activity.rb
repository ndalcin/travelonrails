class Activity < ApplicationRecord
  belongs_to :vacation
  has_many :activity_types
  has_many :types, through: :activity_types
  # accepts_nested_attributes_for :types, :reject_if => proc { |attributes| attributes['name'].blank? }

  def types_attributes=(type_attributes)
    type_attributes.values.each do |type_attribute|
      type = Type.find_or_create_by(type_attribute)
      self.types << type
    end
  end

  def next
    Activity.where('id > ?', self.id).first
  end

  def previous
    Activity.where('id < ?', self.id).last
  end
end
