class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :posts, [:user_id, :created_at] 
    # including both columns as an array we arrange for Rails to create a multiple key index, which means AR uses both keys at the same time
  end
end
