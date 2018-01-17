class VacationActivitySerializer < ActiveModel::Serializer
  attributes :id, :vacation_id, :activity_id, :people, :total_cost 
end
