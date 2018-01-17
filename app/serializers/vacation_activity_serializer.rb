class VacationActivitySerializer < ActiveModel::Serializer
  attributes :id, :vacation_id, :activity_id, :people
  belongs_to :vacation
  belongs_to :activity
end
