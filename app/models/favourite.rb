class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :basket

  validates :basket, uniqueness: { scope: :user}
end
