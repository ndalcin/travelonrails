class User < ApplicationRecord
  has_many :vacations
  
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, 'valid_email_2/email': true
  validates :password, length: { minimum: 6}
end
