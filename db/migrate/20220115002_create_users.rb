class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :is_verified
      t.boolean :send_email_notifications
      t.integer :age

      t.string :bio
      t.string :image

      t.belongs_to :coach, null: true, foreign_key: true

      t.string :password_reset_token
      t.datetime :password_reset_sent_at

      t.timestamps
    end
    
    add_index :users, :email, unique: true

    add_column :users, :gender, :gender
    add_index :users, :gender
  end
end
