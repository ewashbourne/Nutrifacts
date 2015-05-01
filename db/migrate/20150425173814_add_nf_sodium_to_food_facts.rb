class AddNfSodiumToFoodFacts < ActiveRecord::Migration
  def change
    add_column :food_facts, :nf_sodium, :decimal
    add_column :food_facts, :nf_cholesterol, :decimal
    add_column :food_facts, :nf_protein, :decimal
  end
end
