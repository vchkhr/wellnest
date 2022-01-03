class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :image_url
      t.integer :age
      t.string :bio
      
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :gender, null: false, foreign_key: true

      t.timestamps
    end
  end
end
