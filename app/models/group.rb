class Group < ApplicationRecord
  has_many :invitations
  has_many :users, through: :invitations
  has_many :draws
  accepts_nested_attributes_for :users

  validates :name, uniqueness: true, presence: true
  validates :budget, presence: true

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

end
