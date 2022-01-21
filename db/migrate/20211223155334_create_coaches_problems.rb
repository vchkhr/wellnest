class CreateCoachesProblems < ActiveRecord::Migration[6.1]
  def change
    create_table :coaches_problems do |t|
      t.belongs_to :coach
      t.belongs_to :problem
    end
  end
end
