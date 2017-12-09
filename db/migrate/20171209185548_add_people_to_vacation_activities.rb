class AddPeopleToVacationActivities < ActiveRecord::Migration[5.1]
  def change
    add_column :vacation_activities, :people, :integer
  end
end
