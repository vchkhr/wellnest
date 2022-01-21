class CreateSteps < ActiveRecord::Migration[6.1]
  def change
    create_table :steps do |t|
      t.string :title, null: false
      t.string :description, null: false

      t.string :image_url, null: true
      t.string :video_url, null: true
      t.string :audio_url, null: true

      t.timestamps
    end
  end
end
