class AddProfilesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :profile, :string
    add_column :users, :blog_url, :string
  end
end
