class Post < ApplicationRecord
  validates :summary, presence: true, length: { maximum: 140 }
  belongs_to :user
  belongs_to :artist
  belongs_to :album, optional: true
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :content, presence: false
  def post_path
    if album_id.present?
      return "/artists/#{artist.id}/albums/#{album.id}/#{id}/"
    else
      return "/artists/#{artist.id}/#{id}/"
    end
  end
end
