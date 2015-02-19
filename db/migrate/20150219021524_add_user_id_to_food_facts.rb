class AddUserIdToFoodFacts < ActiveRecord::Migration
  def change
    add_column :food_facts, :user_id, :integer
  end
end
