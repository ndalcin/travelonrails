class AddPeopleToActivities < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :people, :integer
  end
end
