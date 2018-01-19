class Type < ApplicationRecord
  has_many :activity_types
  has_many :activities, through: :activity_types

end
