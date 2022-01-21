class CreateCoachNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :coach_notifications do |t|
      t.string :text
      t.belongs_to :coach, null: false, foreign_key: true

      t.timestamps
    end
  end
end
