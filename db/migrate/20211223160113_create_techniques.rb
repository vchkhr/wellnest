class CreateTechniques < ActiveRecord::Migration[6.1]
  def change
    create_table :techniques do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.string :image_url, null: true

      t.integer :age_start, null: false
      t.integer :age_end, null: false

      t.integer :duration_start, null: false
      t.integer :duration_end, null: false

      t.integer :likes, null: true, default: 0
      t.integer :dislikes, null: true, default: 0

      t.timestamps
    end
  end
end
