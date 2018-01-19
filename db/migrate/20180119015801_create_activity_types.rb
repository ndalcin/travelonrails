class CreateActivityTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :activity_types, id: false do |t|
      t.belongs_to :activity, index: true
      t.belongs_to :type, index: true
    end
  end
end
