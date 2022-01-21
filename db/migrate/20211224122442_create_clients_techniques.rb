class CreateClientsTechniques < ActiveRecord::Migration[6.1]
  def change
    create_table :clients_techniques do |t|
      t.belongs_to :client
      t.belongs_to :technique
    end
  end
end
