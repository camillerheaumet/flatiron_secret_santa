class Gift < ApplicationRecord
  belongs_to :wishlist

  validates :name, presence: true

  def currency(price)
    number_to_currency(price, :unit => "£ ", precision: 2, raise: true)
  end
end
