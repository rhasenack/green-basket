class Basket < ApplicationRecord
  has_many :orders, dependant: :destroy

  validates :description, :adress, :price, presence: true
end
