class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :summary
      t.string :blog_url
      t.boolean :public
      t.boolean :comment_flg, null: false, default: true
      t.integer :score, null: true
      t.integer :point, default: 0
      t.string :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
