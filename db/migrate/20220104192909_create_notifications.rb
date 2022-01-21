class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.string :text
      t.belongs_to :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
