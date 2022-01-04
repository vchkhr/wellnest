class CreateClientsProblems < ActiveRecord::Migration[6.1]
  def change
    create_table :clients_problems do |t|
      t.belongs_to :client, null: false, foreign_key: true
      t.belongs_to :problem, null: false, foreign_key: true

      t.timestamps
    end
  end
end
