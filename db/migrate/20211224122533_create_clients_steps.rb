class CreateClientsSteps < ActiveRecord::Migration[6.1]
  def change
    create_table :clients_steps do |t|
      t.belongs_to :client
      t.belongs_to :step
    end
  end
end
