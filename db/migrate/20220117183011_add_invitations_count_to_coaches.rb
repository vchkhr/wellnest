class AddInvitationsCountToCoaches < ActiveRecord::Migration[6.1]
  def self.up
    add_column :coaches, :invitations_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :coaches, :invitations_count
  end
end
