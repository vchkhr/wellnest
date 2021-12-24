class CreateGendersTechniques < ActiveRecord::Migration[6.1]
  def change
    create_table :genders_techniques do |t|
      t.belongs_to :technique
      t.belongs_to :gender
    end
  end
end
