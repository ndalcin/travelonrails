class CreateActivityTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :activity_types do |t|
      t.integer :activity_id
      t.integer :type_id
    end
  end
end
