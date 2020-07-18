class AddTwitterToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :twitter, :string
    add_column :users, :apple, :string
    add_column :users, :spotify, :string
  end
end
