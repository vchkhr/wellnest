class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :photo_url, null: true
      t.integer :age, null: false
      t.string :bio, null: true
      
      t.belongs_to :user
      t.belongs_to :gender, null: false

      t.timestamps
    end
  end
end
