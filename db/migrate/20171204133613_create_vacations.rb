class CreateVacations < ActiveRecord::Migration[5.1]
  def change
    create_table :vacations do |t|
      t.string :name
      t.integer :user_id
      t.integer :destination_id
      t.integer :budget
      t.timestamps
    end
  end
end
