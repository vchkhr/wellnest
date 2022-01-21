class AddCurrentProgressToClients < ActiveRecord::Migration[6.1]
  def self.up
    add_column :clients, :current_progress, :integer, null: false, default: 0
  end

  def self.down
    remove_column :clients, :current_progress
  end
end
