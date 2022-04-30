class Movie < ApplicationRecord
  has_many :bookmarks
  validates :name, :overview, presence: true
end
