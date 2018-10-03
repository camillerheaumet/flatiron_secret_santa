class Group < ApplicationRecord
  has_many :invitations
  has_many :users, through: :invitations
  validates :name, presence: true
  has_many :draws
  accepts_nested_attributes_for :users

  def random

  def draw_order
    users = self.users
    users = users.collect { |x| x }
    draw = []
    100.times do
      users.shuffle!
      draw = users.zip(users.rotate)
      return draw
    end
  end

    #Step 4
    #make random draw

  end

end
