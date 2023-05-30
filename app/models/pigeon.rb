class Pigeon < ApplicationRecord
  belongs_to :user

  validates :name, :color, :price, presence: true
end
