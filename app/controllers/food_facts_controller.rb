class FoodFactsController < ApplicationController

	def search
    @foods = FoodFact.search(params[:food])
	end

  def create
    # @user = User.new(user_params)
    @food_fact = current_user.food_facts.new(food_fact_params)
    if @food_fact.save
      flash[:success] = "Food fact sucessfully saved!"
      redirect_to search_path
    else
      render 'new'
    end
  end

  private

    def food_fact_params
      params.require(:food_fact).permit(:brand_name, :item_name, :serving_size, :nf_calories, :nf_total_fat)
    end

end
