class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.references :user, foreign_key: true
      t.references :following_user, foreign_key: { to_table: :users }, null: true
      t.references :artist, foreign_key: true, null: true
      t.references :album, foreign_key: true, null: true
      t.timestamps
    end
  end
end
