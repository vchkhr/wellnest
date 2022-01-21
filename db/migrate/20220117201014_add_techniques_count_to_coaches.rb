class AddTechniquesCountToCoaches < ActiveRecord::Migration[6.1]
  def self.up
    add_column :coaches, :techniques_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :coaches, :techniques_count
  end
end
