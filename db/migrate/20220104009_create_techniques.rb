class CreateTechniques < ActiveRecord::Migration[6.1]
  def change
    create_table :techniques do |t|
      t.string :title
      t.string :description
      t.string :image
      t.integer :age_start
      t.integer :age_end
      t.integer :duration_start
      t.integer :duration_end

      t.timestamps
    end

    add_column :techniques, :gender_cd, :integer
  end
end
