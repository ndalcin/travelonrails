class VacationSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :budget, , :activities_total
  has_many :vacation_activities, serializer: VacationActivitySerializer
end
