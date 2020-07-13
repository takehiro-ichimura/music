class CreateAlbums < ActiveRecord::Migration[6.0]
  def change
    create_table :albums do |t|
      t.string :name
      t.string :othername
      t.string :apple
      t.string :spotify
      t.string :wikipedia
      t.boolean :edit_flg
      t.string :tags
      t.string :bandcamp
      t.references :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
