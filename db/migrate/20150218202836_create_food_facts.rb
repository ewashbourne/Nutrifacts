class CreateFoodFacts < ActiveRecord::Migration
  def change
    create_table :food_facts do |t|
      t.string :item_name
      t.string :brand_name
      t.string :item_id
      t.string :brand_id
      t.decimal :nf_calories
      t.decimal :nf_total_fat

      t.timestamps null: false
    end
  end
end
