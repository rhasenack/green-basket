class Basket < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :favourites
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :description, :address, :price, presence: true
  validates :status, inclusion: { in: %w[available reserved unavailable] }
  has_one_attached :photo


end
