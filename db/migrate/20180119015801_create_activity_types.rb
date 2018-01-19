class CreateActivityTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :activity_types do |t|
      t.integer :category_id
      t.integer :product_id
    end
  end
end
