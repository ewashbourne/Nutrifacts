class AddNfServingSizeQtyToFoodFacts < ActiveRecord::Migration
  def change
    add_column :food_facts, :nf_serving_size_qty, :integer
  end
end
