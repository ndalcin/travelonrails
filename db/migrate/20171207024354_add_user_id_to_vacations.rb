class AddUserIdToVacations < ActiveRecord::Migration[5.1]
  def change
    add_column :vacations, :user_id, :integer
  end
end
