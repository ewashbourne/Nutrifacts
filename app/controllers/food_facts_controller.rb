class FoodFactsController < ApplicationController

	def search
    @food = FoodFact.search(params[:food])
	end

end
