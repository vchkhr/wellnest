class AddActiveClientsCountToCoaches < ActiveRecord::Migration[6.1]
  def self.up
    add_column :coaches, :active_clients_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :coaches, :active_clients_count
  end
end
