class ChangeColumnToAllowNull < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :album_id, :integer, null: true
  end
end
