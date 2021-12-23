class CreateCoaches < ActiveRecord::Migration[6.1]
  def change
    create_table :coaches do |t|
      t.string :photo_url, null: true
      t.integer :age, null: false
      t.string :edu, null: false
      t.string :work, null: false
      t.string :licenses, null: false
      t.string :links, null: false
      t.string :is_verified, null: false
      
      t.belongs_to :user
      t.integer :gender_id, null: false

      t.timestamps
    end
  end
end
