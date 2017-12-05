class Vacation < ApplicationRecord
  belongs_to :destination
  has_many :user_vacations
  has_many :users, through: :user_vacations
  has_many :vacation_activities
  has_many :activities, through: :vacation_activities
end
