class Artist < ApplicationRecord
  validates :name, presence: true
  has_many :albums, dependent: :destroy
  has_many :posts, dependent: :destroy
  def average_score
    (recieved_scores.sum(:score)/recieved_scores.count.to_f).round(2)
  end
  def recieved_scores
    posts.where.not(score: nil)
  end
end
