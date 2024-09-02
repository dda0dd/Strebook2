class CreateRequestComments < ActiveRecord::Migration[6.1]
  def change
    create_table :request_comments do |t|
      t.integer :customer_id, null: false
      t.text :content, null: false, default: ""

      t.timestamps
    end
  end
end
