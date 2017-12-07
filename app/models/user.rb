class User < ApplicationRecord

  has_many :vacations

  has_secure_password
  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 6}
end
