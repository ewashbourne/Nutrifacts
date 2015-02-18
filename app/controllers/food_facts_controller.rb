class FoodFactsController < ApplicationController

	def index
    @food = FoodFact.search(params[:food])
	end

end
