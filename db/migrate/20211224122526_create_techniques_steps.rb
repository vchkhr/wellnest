class CreateTechniquesSteps < ActiveRecord::Migration[6.1]
  def change
    create_table :techniques_steps do |t|
      t.belongs_to :technique
      t.belongs_to :step
    end
  end
end
