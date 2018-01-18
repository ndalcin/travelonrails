class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :type_id, :rating
  has_many :vacation_activities, serializer: VacationActivitySerializer
end
