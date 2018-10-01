class User < ApplicationRecord
  has_one :wish_list
  has_many :gifts, through: :wish_list
  has_many :user_groups
  has_many :groups, through: :user_groups
end
