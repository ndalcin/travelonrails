class Destination < ApplicationRecord
  has_many :vacations
  has_many :users, through: :vacations

  def self.domestic
    where(country: "USA")
  end

  def self.international
    where.not(country: "USA")
  end

  def full_name
    "#{self.city}, #{self.country}"
  end
end
