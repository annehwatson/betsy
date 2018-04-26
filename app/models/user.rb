class User < ApplicationRecord
  before_validation :downcase_email

  has_many :products, dependent: :destroy
  has_many :orderitems, through: :products
  has_many :orders, through: :orderitems

  validates :username, presence: true, uniqueness: true
  # validates :password, presence: true
  # validates :email, uniqueness: { message: 'Email is already in use' }

  private
  def downcase_email
    self.email = email.downcase if email.present?
  end
end
