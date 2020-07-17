class Post < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  belongs_to :artist
  belongs_to :album, optional: true
  has_many :likes
end
