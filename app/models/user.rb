class User < ApplicationRecord
  has_many :invitations
  has_many :groups, through: :invitations
  has_one :wishlist
  has_many :gifts, through: :wishlist
  has_secure_password

  def create_a_group
    Group.new(self, more_details)
  end


end
