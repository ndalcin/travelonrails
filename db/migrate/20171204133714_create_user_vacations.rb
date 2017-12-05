class CreateUserVacations < ActiveRecord::Migration[5.1]
  def change
    create_table :user_vacations do |t|
      t.integer :user_id
      t.integer :vacation_id
      t.date :date_of_travel
      t.timestamps
    end
  end
end
