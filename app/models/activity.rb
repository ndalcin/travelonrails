class Activity < ApplicationRecord
  belongs_to :vacation
  has_many :activity_types
  has_many :types, through: :activity_types
  accepts_nested_attributes_for :types, :reject_if => proc { |attributes| attributes['name'].blank? }


end
