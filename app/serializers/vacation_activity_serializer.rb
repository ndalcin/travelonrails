class VacationActivitySerializer < ActiveModel::Serializer
  attributes :id, :vacation_id, :activity_id, :people, :total_cost
  belongs_to :activity, serializer: :ActivitySerializer
  belongs_to :vacation, serializer: :VacationSerializer
end
