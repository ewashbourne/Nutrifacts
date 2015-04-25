class FoodFact < ActiveRecord::Base

  belongs_to :user

  validates :item_name, presence: true, length: { minimum: 3, maximum: 254 }
  validates :brand_name, presence: true

  def self.search(food)
    food ||= " "
    food.gsub!(" ", "%20")
    response = HTTParty.get "https://api.nutritionix.com/v1_1/search/#{food}?results=0%3A20&cal_min=0&cal_max=50000&fields=item_name%2Cbrand_name%2Citem_id%2Cbrand_id%2Cnf_calories%2Cnf_total_fat%2Cnf_serving_size_qty%2Cnf_sugars%2Cnf_sodium%2Cnf_cholesterol%2Cnf_protein%2Cnf_saturated_fat%2Cnf_dietary_fiber%2Cnf_vitamin_a_dv%2Cnf_vitamin_c_dv%2Cnf_calcium_dv%2Cnf_iron_dv%2Cnf_potassium&appId=a0574aeb&appKey=871d8792fe64d737aca0eb9314f7f018"
    response["hits"].map { |hit| hit["fields"] }
  end
end

