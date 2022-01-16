class CreateInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :invitations do |t|
      t.integer :status
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :coach, null: false, foreign_key: true

      t.timestamps
    end
  end
end
