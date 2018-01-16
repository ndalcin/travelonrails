class VacationSerializer < ActiveModel::Serializer
  attributes :id, :date, :budget, :length, :destination_id
  belongs_to :user
  has_many :vacation_activities
  has_many :activities, through: :vacation_activities
end
