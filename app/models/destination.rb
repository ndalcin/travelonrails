class Destination < ApplicationRecord
  has_many :vacations

  def self.international?
    true unless country == "USA"
  end

  def full_name
    "#{self.city}, #{self.country}"
  end
end
