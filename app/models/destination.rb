class Destination < ApplicationRecord
  has_many :vacations
  validates_presence_of :city
  validates_presence_of :country

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
