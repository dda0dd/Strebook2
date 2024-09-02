class CreateThoughtseComments < ActiveRecord::Migration[6.1]
  def change
    create_table :thoughtse_comments do |t|
      t.integer :customer_id, null: false
      t.integer :post_id, null: false
      t.float :evaluation_score, null: false
      t.string :content, null: false, default: ""

      t.timestamps
    end
  end
end
