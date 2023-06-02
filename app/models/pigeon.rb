class Pigeon < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :photo

  geocoded_by :address

  validates :name, :color, :price, :address, presence: true

  after_validation :geocode, if: :will_save_change_to_address?
end
