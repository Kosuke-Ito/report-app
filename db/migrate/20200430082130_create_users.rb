class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string  :password_digest, null: false
      t.string  :name, limit: 20
      t.integer :boss_id, limit: 4
      t.integer :subordinate_id, limit: 4
      t.boolean :admin_flag, null: false, default: 0

      t.timestamps null: false
    end
  end
end
