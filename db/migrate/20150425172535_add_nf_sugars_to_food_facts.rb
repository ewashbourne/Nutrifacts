class AddNfSugarsToFoodFacts < ActiveRecord::Migration
  def change
    add_column :food_facts, :nf_sugars, :decimal
  end
end
