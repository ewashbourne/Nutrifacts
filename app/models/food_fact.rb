require 'httparty'

class FoodFact < ActiveRecord::Base

	belongs_to :user

	def self.search(food)

		food ||= "cheeseburger"
		food.gsub!(" ", "%20")

		response = HTTParty.get "https://api.nutritionix.com/v1_1/search/#{food}?results=0%3A01&cal_min=0&cal_max=50000&fields=item_name%2Cbrand_name%2Citem_id%2Cbrand_id%2Cnf_calories%2Cnf_total_fat&appId=a0574aeb&appKey=871d8792fe64d737aca0eb9314f7f018"

		response['hits'][0]['fields']

	end
end
