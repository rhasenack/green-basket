class Basket < ApplicationRecord
  has_many :orders, dependent: :destroy

  validates :description, :address, :price, presence: true

  has_one_attached :photo

end
