class VacationSerializer < ActiveModel::Serializer
  attributes :id, :date, :budget, :length, :destination_id
  belongs_to :user
end
