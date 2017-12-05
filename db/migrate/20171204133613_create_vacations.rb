class CreateVacations < ActiveRecord::Migration[5.1]
  def change
    create_table :vacations do |t|
      t.string :name
      t.integer :destination_id
      t.integer :min_budget
      t.integer :length
      t.timestamps
    end
  end
end
