class Song < ApplicationRecord
  belongs_to :user

  validates :artist, presence: true
  validates :title, presence: true

end
