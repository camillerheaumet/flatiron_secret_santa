class User < ApplicationRecord
  has_many :invitations
  has_many :groups, through: :invitations
  has_one :wishlist
  has_many :gifts, through: :wishlist
  has_secure_password

  validates :name, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 

end
