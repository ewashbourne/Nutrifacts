class FoodFact < ActiveRecord::Base

	belongs_to :user

	def self.search(food)

		food ||= " "
		food.gsub!(" ", "%20")
		response = HTTParty.get "https://api.nutritionix.com/v1_1/search/#{food}?results=0%3A20&cal_min=0&cal_max=50000&fields=item_name%2Cbrand_name%2Citem_id%2Cbrand_id%2Cnf_calories%2Cnf_total_fat&appId=a0574aeb&appKey=871d8792fe64d737aca0eb9314f7f018"
		response["hits"].map { |hit| hit["fields"] }
	

    # response.each do |f|
    #   FoodFact.new(item_name:     f["item_name"],
    #                brand_name:    f["brand_name"],
    #                item_id:       f["item_id"],
    #                brand_id:      f["brand_id"],
    #                nf_calories:   f["nf_calories"],
    #                nf_total_fat:  f["nf_total_fat"],
    #                user_id:       f["user_id"],
    #                serving_size:  f["serving_size"]
    #                )
    # end
	end

end

