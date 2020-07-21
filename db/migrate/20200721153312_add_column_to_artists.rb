class AddColumnToArtists < ActiveRecord::Migration[6.0]
  def change
    add_column :artists, :apple, :string
    add_column :artists, :spotify, :string
    add_column :artists, :bandcamp, :string
    add_column :artists, :wikipedia, :string
  end
end
