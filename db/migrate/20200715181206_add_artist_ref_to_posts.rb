class AddArtistRefToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :artist, null: false, foreign_key: true
  end
end
