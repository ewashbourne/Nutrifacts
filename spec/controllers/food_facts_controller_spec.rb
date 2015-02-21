require 'rails_helper'

RSpec.describe FoodFactsController, :type => :controller do

  let(:food_fact1) { FoodFact.create(item_name: "Big Mac", brand_name: "McDonald's"
                                     nf_serving_size_qty: 1, nf_calories: 5,000, 
                                     nf_total_fat: 800) }  

end
