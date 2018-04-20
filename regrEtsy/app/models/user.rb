class User < ApplicationRecord

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true
  # validates_format_of :password, :with => /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}/
end
