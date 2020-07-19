class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :stocks, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :following_users, through: :follows
  has_many :following_artists, class_name: 'Follow', foreign_key: :artist_id, dependent: :destroy
  has_many :following_albums, class_name: 'Follow', foreign_key: :album_id, dependent: :destroy
  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
  def already_stocked?(post)
    self.stocks.exists?(post_id: post.id)
  end
  def already_user_followed?(user)
    self.follows.exists?(following_user_id: user.id)
  end
  def already_artist_followed?(artist)
    self.follows.exists?(artist_id: artist.id)
  end
  def already_album_followed?(album)
    self.follows.exists?(album_id: album.id)
  end
end
