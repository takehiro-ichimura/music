class AddColumnAlbums < ActiveRecord::Migration[6.0]
  def change
    add_column :artists, :imagelink, :string
  end
end
