class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false, limit: 50
      t.text :content, null: false
      t.boolean :date_type, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.references :user, foreign_key: true
      t.boolean :admin_flag, null: false, default: 0

      t.timestamps
    end
  end
end
