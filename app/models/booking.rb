class Booking < ApplicationRecord
  belongs_to :pigeon
  belongs_to :user
end
