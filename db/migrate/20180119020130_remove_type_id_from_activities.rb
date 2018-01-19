class RemoveTypeIdFromActivities < ActiveRecord::Migration[5.1]
  def change
    remove_column :activities, :type_id, :integer
  end
end
