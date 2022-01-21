class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :text
      t.boolean :from_client
      t.belongs_to :client, null: false, foreign_key: true
      t.belongs_to :coach, null: false, foreign_key: true

      t.timestamps
    end
  end
end
