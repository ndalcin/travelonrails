class VacationSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :budget, :length, :activities_total
  belongs_to :user
  belongs_to :destination
  has_many :vacation_activities
  has_many :activities, through: :vacation_activities
end
