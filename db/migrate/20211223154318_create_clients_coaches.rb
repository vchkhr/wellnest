class CreateClientsCoaches < ActiveRecord::Migration[6.1]
  def change
    create_table :clients_coaches do |t|
      t.belongs_to :client
      t.belongs_to :coach
    end
  end
end
