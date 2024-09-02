class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :book_store_id, null: false
      t.text :title, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
