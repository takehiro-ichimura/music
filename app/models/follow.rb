class Follow < ApplicationRecord
	belongs_to :user
	belongs_to :following_user, class_name: 'User', optional: true
	belongs_to :artist, optional: true
	belongs_to :album, optional: true
	validates_uniqueness_of :user_id, scope: [:artist, :album, :user]
end
