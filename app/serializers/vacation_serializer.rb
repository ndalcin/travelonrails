class VacationSerializer < ActiveModel::Serializer
  attributes :id, :name, :budget, :activities_total, :budget_remaining
  has_many :activities, serializer: ActivitySerializer
end
