class Pigeon < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, :color, :price, presence: true
end
