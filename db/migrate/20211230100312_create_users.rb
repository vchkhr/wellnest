class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :is_verified
      t.boolean :send_email_notifications

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
