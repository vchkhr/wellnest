class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.string :text

      t.belongs_to :client

      t.timestamps
    end
  end
end
