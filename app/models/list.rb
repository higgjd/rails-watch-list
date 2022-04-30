class List < ApplicationRecord
  has_many :bookmarks
  validates :name, uniqueness: true, presence: true
end
