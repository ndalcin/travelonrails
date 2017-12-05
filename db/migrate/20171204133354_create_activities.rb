class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.integer :price
      t.integer :type_id
      t.integer :rating
      t.timestamps
    end
  end
end
