class AddTotalProgressToClients < ActiveRecord::Migration[6.1]
  def self.up
    add_column :clients, :total_progress, :integer, null: false, default: 0
  end

  def self.down
    remove_column :clients, :total_progress
  end
end
