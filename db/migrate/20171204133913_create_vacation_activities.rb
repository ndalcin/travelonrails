class CreateVacationActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :vacation_activities do |t|
      t.integer :vacation_id
      t.integer :activity_id
      t.timestamps
    end
  end
end
