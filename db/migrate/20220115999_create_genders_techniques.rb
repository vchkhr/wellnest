class CreateGendersTechniques < ActiveRecord::Migration[6.1]
  def change
    create_table :genders_techniques do |t|
      t.belongs_to :gender, null: false, foreign_key: true
      t.belongs_to :technique, null: false, foreign_key: true

      t.timestamps
    end
  end
end
