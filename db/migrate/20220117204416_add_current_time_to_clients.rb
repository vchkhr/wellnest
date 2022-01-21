class AddCurrentTimeToClients < ActiveRecord::Migration[6.1]
  def self.up
    add_column :clients, :current_time, :float, null: false, default: 0
  end

  def self.down
    remove_column :clients, :current_time
  end
end
