class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.references :user, foreign_key: true
      t.integer :answers_count, default: 0
      t.integer :likes_count, default: 0
      t.datetime :published_at

      t.timestamps
    end
  end
end
