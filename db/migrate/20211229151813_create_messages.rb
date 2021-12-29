class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :text, null: false
      t.boolean :from_client

      t.belongs_to :client
      t.belongs_to :coach

      t.timestamps
    end
  end
end
