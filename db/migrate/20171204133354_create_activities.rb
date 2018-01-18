class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.integer :price
      t.integer :type_id
      t.integer :rating
      t.integer :destination_id
      t.integer :vacation_id
      t.timestamps
    end
  end
end
