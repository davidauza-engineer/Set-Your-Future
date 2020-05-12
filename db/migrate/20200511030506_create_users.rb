class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username, limit: 50, null: false
      t.string :email, limit: 50, null: false
      t.string :password_digest, limit: 72, null: false

      t.timestamps
    end
    add_index :users, [:username, :email], unique: true
  end
end
