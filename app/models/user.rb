class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favourites

  ROLES = %w[Restaurant Consumer]
  validates :role, inclusion: { in: ROLES }

  def restaurant?
    role == 'Restaurant'
  end

  def consumer?
    role == 'Consumer'
  end
end
