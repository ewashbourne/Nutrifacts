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

  def destroy
    puts "DESTROY: params = #{params}"
    food_fact = FoodFact.find(params[:id])
    name_of_deleted_fact = food_fact.item_name
    food_fact.destroy
    flash[:success] = "You deleted the #{name_of_deleted_fact}."
    redirect_to index_path
  end

  private

  def food_fact_params
    params.require(:food_fact).permit(:brand_name, :item_name, :nf_serving_size_qty, :nf_calories, :nf_total_fat, :nf_sugars, :nf_sodium, :nf_cholesterol, :nf_protein, :nf_saturated_fat, :nf_dietary_fiber, :nf_vitamin_a_dv, :nf_vitamin_c_dv, :nf_calcium_dv, :nf_iron_dv, :nf_potassium)
  end
end
