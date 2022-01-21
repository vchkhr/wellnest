class AddTotalClientsCountToCoaches < ActiveRecord::Migration[6.1]
  def self.up
    add_column :coaches, :total_clients_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :coaches, :total_clients_count
  end
end
