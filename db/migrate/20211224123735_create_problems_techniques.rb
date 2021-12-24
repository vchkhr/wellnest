class CreateProblemsTechniques < ActiveRecord::Migration[6.1]
  def change
    create_table :problems_techniques do |t|
      t.belongs_to :technique
      t.belongs_to :problem
    end
  end
end
