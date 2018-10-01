class UserGroups < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :invited_users, through: :group
end
