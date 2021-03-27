class AddColumnArtists < ActiveRecord::Migration[6.0]
  def change
    add_column :albums, :imagelink, :string
  end
end
