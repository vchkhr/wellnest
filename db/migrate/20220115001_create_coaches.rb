class CreateCoaches < ActiveRecord::Migration[6.1]
  def change
    create_table :coaches do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :is_verified
      t.boolean :send_email_notifications
      t.integer :age

      t.belongs_to :gender, null: false, foreign_key: true

      t.string :bio
      t.string :image

      t.string :education
      t.string :work
      t.string :licenses
      t.string :links

      t.string :password_reset_token
      t.datetime :password_reset_sent_at
      
      t.timestamps
    end
    
    add_index :coaches, :email, unique: true
  end
end
