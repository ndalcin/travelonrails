class AddPeopleToVacations < ActiveRecord::Migration[5.1]
  def change
    add_column :vacations, :people, :integer
  end
end
