class Basket < ApplicationRecord
  has_many :orders, dependent: :destroy

  validates :description, :address, :price, presence: true
  validates :status, inclusion: { in: %w[available reserved unavailable] }
  has_one_attached :photo
end
