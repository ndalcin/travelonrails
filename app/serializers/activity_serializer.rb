class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :type_id, :rating
end
