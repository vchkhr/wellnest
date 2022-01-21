class CreateClientsProblems < ActiveRecord::Migration[6.1]
  def change
    create_table :clients_problems do |t|
      t.belongs_to :client
      t.belongs_to :problem
    end
  end
end
