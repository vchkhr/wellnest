class CreateInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :invitations do |t|
      t.integer :status
      
      t.belongs_to :client
      t.belongs_to :coach

      t.timestamps
    end
  end
end
