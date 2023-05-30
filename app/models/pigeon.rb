class Pigeon < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :name, :color, :price, :city, presence: true
end
