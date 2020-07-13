class CreateArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :artists do |t|
      t.string :name, null: false
      t.string :othername
      t.string :tags
      t.boolean :edit_flg, default: false, null: false

      t.timestamps
    end
  end
end
