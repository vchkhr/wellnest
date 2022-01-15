class CreateGenders < ActiveRecord::Migration[6.1]
  def change
    execute <<-SQL
      CREATE TYPE gender AS ENUM ('male', 'female');
    SQL
  end
end
