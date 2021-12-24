class CreateSteps < ActiveRecord::Migration[6.1]
  def change
    create_table :steps do |t|
      t.string :title, null: false
      t.string :description, null: false

      t.integer :photo_url, null: true
      t.integer :video_url, null: true
      t.integer :audio_url, null: true

      t.timestamps
    end
  end
end
