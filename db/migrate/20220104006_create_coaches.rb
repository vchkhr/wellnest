class CreateCoaches < ActiveRecord::Migration[6.1]
  def change
    create_table :coaches do |t|
      t.string :image
      t.integer :age
      t.string :education
      t.string :work
      t.string :licenses
      t.string :links
      
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :gender, null: false, foreign_key: true

      t.timestamps
    end
  end
end
