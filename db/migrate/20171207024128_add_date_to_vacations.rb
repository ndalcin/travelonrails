class AddDateToVacations < ActiveRecord::Migration[5.1]
  def change
    add_column :vacations, :date, :date
  end
end
