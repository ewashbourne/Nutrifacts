class AddNfSaturatedFatToFoodFacts < ActiveRecord::Migration
  def change
    add_column :food_facts, :nf_saturated_fat, :decimal
    add_column :food_facts, :nf_dietary_fiber, :decimal
    add_column :food_facts, :nf_vitamin_a_dv, :integer
    add_column :food_facts, :nf_vitamin_c_dv, :integer
    add_column :food_facts, :nf_calcium_dv, :integer
    add_column :food_facts, :nf_iron_dv, :integer
    add_column :food_facts, :nf_potassium, :decimal
  end
end
