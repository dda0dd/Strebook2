class CreateBookStoreTags < ActiveRecord::Migration[6.1]
  def change
    create_table :book_store_tags do |t|
      t.integer :book_store_id, null: false
      t.integer :tag_id, null: false

      t.timestamps
    end
  end
end
