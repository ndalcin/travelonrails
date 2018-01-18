class User < ApplicationRecord
  has_many :vacations
  has_many :destinations, through: :vacations
  has_many :activities, through: :vacations

  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, 'valid_email_2/email': true
  validates :password_digest, length: { minimum: 6}
end
