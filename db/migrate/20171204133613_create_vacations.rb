class CreateVacations < ActiveRecord::Migration[5.1]
  def change
    create_table :vacations do |t|
      t.string :name
      t.string :date
      t.integer :user_id
      t.integer :budget
      t.integer :length
      t.timestamps
    end
  end
end
