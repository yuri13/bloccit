class User < ApplicationRecord
# # register an inline callback directly after before_save
  before_save { self.email = email.downcase if email.present? }

# #validates function ensures that name is present and proper length
  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
# #validate password
 validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
 validates :password, length: { minimum: 6 }, allow_blank: true
# #validate email present unique and proper length
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 254 }

# #adds methods to set and authenticate against a BCrypt password
  has_secure_password

end