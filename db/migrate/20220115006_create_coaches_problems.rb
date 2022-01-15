class CreateCoachesProblems < ActiveRecord::Migration[6.1]
  def change
    create_table :coaches_problems do |t|
      t.belongs_to :coach, null: false, foreign_key: true
      t.belongs_to :problem, null: false, foreign_key: true

      t.timestamps
    end
  end
end
