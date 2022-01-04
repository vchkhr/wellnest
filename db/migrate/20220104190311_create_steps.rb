class CreateSteps < ActiveRecord::Migration[6.1]
  def change
    create_table :steps do |t|
      t.string :title
      t.string :description
      t.string :image
      t.string :video
      t.string :audio

      t.timestamps
    end
  end
end
