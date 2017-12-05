class Destination < ApplicationRecord
  has_many :vacations

  def self.international?
    true unless country == "USA"
  end
  
end
