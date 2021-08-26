class Review < ApplicationRecord
  belongs_to :basket
  validates :content, presence: true
end
