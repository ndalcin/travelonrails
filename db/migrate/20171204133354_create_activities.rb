class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.integer :price
      t.integer :vacation_id
      t.timestamps
    end
  end
end
