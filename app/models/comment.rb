class Comment < ApplicationRecord
  belongs_to :pigeon

  validates :content, presence: true
end
