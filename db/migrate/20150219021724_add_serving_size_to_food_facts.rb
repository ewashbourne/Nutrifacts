class AddServingSizeToFoodFacts < ActiveRecord::Migration
  def change
    add_column :food_facts, :serving_size, :integer
  end
end
