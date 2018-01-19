class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :name, :price
  
  has_many :types
end
