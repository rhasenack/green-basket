class Basket < ApplicationRecord
  has_many :orders, dependent: :destroy

  validates :description, :address, :price, presence: true
end
